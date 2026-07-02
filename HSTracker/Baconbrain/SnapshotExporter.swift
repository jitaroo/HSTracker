//
//  SnapshotExporter.swift
//  HSTracker
//
//  BACONBRAIN: sensor exporter singleton (BRS §3, §4 all, D6, D7, D16).
//  Owns the ExporterContext (cross-hook state), builds snapshots via SnapshotBuilder, applies the
//  §4.3 emit rule (hash-based change detection + 100ms debounce with forced-path bypass), and
//  fans the encoded NDJSON line out to the loopback transport and the debug sink.
//

import BaconbrainKit
import Foundation

/// Cross-hook state consumed by SnapshotBuilder. Every field here is read/written exclusively on
/// SnapshotExporter's serial `queue` — no additional locking is required or should be added.
final class ExporterContext {
    var lastCombatPrediction: CombatPrediction?

    private(set) var offeredTrinketEntityIds: [Int] = []
    private(set) var trinketOfferOrdinal: Int = 0
    private var trinketKindByCardId: [String: TrinketKind] = [:]

    var comps: [BattlegroundsCompStats.LobbyComp]?
    var heroPickStats: [BattlegroundsHeroPickStats.BattlegroundsSingleHeroPickStats]?
    var trinketPickStats: [BattlegroundsTrinketPickStats.BattlegroundsSingleTrinketPickStats]?

    func setOfferedTrinkets(_ offered: [Entity]) {
        guard !offered.isEmpty else { return }
        offeredTrinketEntityIds = offered.map { $0.id }
        trinketOfferOrdinal += 1
        let kind: TrinketKind = trinketOfferOrdinal <= 1 ? .lesser : .greater
        for entity in offered where trinketKindByCardId[entity.cardId] == nil {
            trinketKindByCardId[entity.cardId] = kind
        }
    }

    func clearOfferedTrinkets() {
        offeredTrinketEntityIds = []
    }

    func kind(forCardId cardId: String) -> TrinketKind {
        trinketKindByCardId[cardId] ?? .lesser
    }

    func reset() {
        lastCombatPrediction = nil
        offeredTrinketEntityIds = []
        trinketOfferOrdinal = 0
        trinketKindByCardId = [:]
        comps = nil
        heroPickStats = nil
        trinketPickStats = nil
    }
}

final class SnapshotExporter {
    static let shared = SnapshotExporter()

    private let queue = DispatchQueue(label: "baconbrain.exporter")
    private let transport = BaconbrainTransport()
    private let sink = NDJSONSink()
    private let ctx = ExporterContext()

    private let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        return encoder
    }()

    private static let minEmitInterval: DispatchTimeInterval = .milliseconds(100)

    private var lastHash: Int?
    private var lastEmitAt: DispatchTime = .now()
    private var lastSentTurn: Int?
    private var lastSentPhase: Phase?
    private var pendingTrailingEmit: DispatchWorkItem?
    private var latestLine: Data?

    private init() {
        transport.latestLineProvider = { [weak self] in
            guard let self else { return nil }
            return self.queue.sync { self.latestLine }
        }
    }

    // MARK: - Lifecycle

    func start() {
        queue.async { [weak self] in
            self?.transport.start()
        }
    }

    // MARK: - Entry points (all hop onto `queue`)

    func emitIfChanged(game: Game) {
        queue.async { [weak self] in
            self?.emit(game: game, forced: false)
        }
    }

    func onTurnStart(game: Game) {
        queue.async { [weak self] in
            guard let self else { return }
            // Turn rollover always ends a trinket offer (mirrors HSTracker's own viewModel reset).
            self.ctx.clearOfferedTrinkets()
            self.emit(game: game, forced: true)
        }
    }

    func onGameReset(gameId: String) {
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.reset()
            self.lastHash = nil
            self.lastSentTurn = nil
            self.lastSentPhase = nil
            self.pendingTrailingEmit?.cancel()
            self.pendingTrailingEmit = nil
            self.latestLine = nil
        }
    }

    func onBobsBuddyResult(
        winRate: Float, tieRate: Float, lossRate: Float,
        myDeathRate: Float, theirDeathRate: Float,
        damageResults: [Int32], game: Game
    ) {
        queue.async { [weak self] in
            guard let self else { return }
            let damageTaken = damageResults.filter { $0 < 0 }.map { Double(-$0) }
            let avgDamageTaken = damageTaken.isEmpty ? 0 : damageTaken.reduce(0, +) / Double(damageTaken.count)
            // Lethal naming: we kill them = theirDeathRate; BobsBuddyPanel passes playerLethal:
            // theirDeathRate, so myLethalPct=theirDeathRate / theirLethalPct=myDeathRate (§8).
            self.ctx.lastCombatPrediction = CombatPrediction(
                winPct: Double(winRate),
                tiePct: Double(tieRate),
                lossPct: Double(lossRate),
                avgDamageTaken: avgDamageTaken,
                theirLethalPct: Double(myDeathRate),
                myLethalPct: Double(theirDeathRate)
            )
            self.emit(game: game, forced: true)
        }
    }

    func onTrinketOffer(
        offered: [Entity],
        stats: [BattlegroundsTrinketPickStats.BattlegroundsSingleTrinketPickStats]?,
        game: Game
    ) {
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.setOfferedTrinkets(offered)
            if let stats {
                self.ctx.trinketPickStats = stats
            }
            self.emit(game: game, forced: true)
        }
    }

    func onTrinketOfferEnded(game: Game) {
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.clearOfferedTrinkets()
            self.emit(game: game, forced: true)
        }
    }

    func onCompStats(_ comps: [BattlegroundsCompStats.LobbyComp], game: Game) {
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.comps = comps
            self.emit(game: game, forced: false)
        }
    }

    func onHeroPickStats(_ stats: [BattlegroundsHeroPickStats.BattlegroundsSingleHeroPickStats], game: Game) {
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.heroPickStats = stats
            self.emit(game: game, forced: false)
        }
    }

    // MARK: - Emit pipeline (queue-confined)

    private func emit(game: Game, forced: Bool) {
        guard !game.spectator else { return }
        guard let snapshot = SnapshotBuilder.build(game: game, ctx: ctx) else { return }
        guard let data = try? encoder.encode(snapshot) else { return }

        var hasher = Hasher()
        hasher.combine(data)
        let hash = hasher.finalize()
        if hash == lastHash {
            return
        }

        let turnOrPhaseChanged = snapshot.turn != lastSentTurn || snapshot.phase != lastSentPhase
        let mustForce = forced || turnOrPhaseChanged

        let now = DispatchTime.now()
        if !mustForce, now < lastEmitAt + Self.minEmitInterval {
            scheduleTrailingEmit(game: game)
            return
        }

        pendingTrailingEmit?.cancel()
        pendingTrailingEmit = nil
        lastHash = hash
        lastEmitAt = now
        lastSentTurn = snapshot.turn
        lastSentPhase = snapshot.phase
        send(data: data)
    }

    private func scheduleTrailingEmit(game: Game) {
        pendingTrailingEmit?.cancel()
        let deadline = lastEmitAt + Self.minEmitInterval
        let workItem = DispatchWorkItem { [weak self] in
            self?.emit(game: game, forced: true)
        }
        pendingTrailingEmit = workItem
        queue.asyncAfter(deadline: deadline, execute: workItem)
    }

    private func send(data: Data) {
        var line = data
        line.append(0x0A) // "\n" — NDJSON frame terminator
        latestLine = line
        transport.broadcast(line)
        sink.append(line)
    }
}
