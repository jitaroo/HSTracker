//
//  SnapshotExporter.swift
//  HSTracker
//
//  BACONBRAIN: sensor exporter singleton (BRS §3, §4 all, D6, D7, D16).
//  Owns the ExporterContext (cross-hook state), builds snapshots via SnapshotBuilder, applies the
//  §4.3 emit rule (hash-based change detection + 100ms debounce with forced-path bypass), and
//  fans the encoded NDJSON line out to the loopback transport and the debug sink.
//
//  BACONBRAIN (Codex review F3 — the critical fix): the live Game/Entity graph is continuously
//  mutated by HSTracker's own log-parsing thread. The original implementation hopped every entry
//  point onto this file's private `queue` via `queue.async` *before* calling SnapshotBuilder.build,
//  so the actual read of `game` happened later, on a fourth/unrelated thread, an unbounded time
//  after the caller captured the reference — a torn-snapshot / data race waiting to happen. Every
//  entry point below now builds and JSON-encodes the GameSnapshot synchronously, in place, on
//  whichever thread called it (that call's "funnel thread"), and only the resulting *immutable*
//  GameSnapshot/Data crosses over to `queue` for hashing, debounce bookkeeping, and broadcast/sink.
//  The one exception is onBobsBuddyResult — see its doc comment.
//

import BaconbrainKit
import Foundation

/// Cross-hook state consumed by SnapshotBuilder. All mutable exporter bookkeeping —
/// this context plus SnapshotExporter's own hash/debounce state — is owned exclusively by
/// SnapshotExporter's serial `queue`; nothing outside SnapshotExporter.swift ever touches it.
/// Reads for a synchronous, funnel-thread snapshot build never touch this class directly: they
/// go through `snapshot()`, called via `queue.sync`, which copies the handful of fields
/// SnapshotBuilder needs into a plain, `Sendable` `ExporterContextSnapshot` value. That value —
/// not this class — is what ever crosses off of `queue`.
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

    func reset() {
        lastCombatPrediction = nil
        offeredTrinketEntityIds = []
        trinketOfferOrdinal = 0
        trinketKindByCardId = [:]
        comps = nil
        heroPickStats = nil
        trinketPickStats = nil
    }

    /// Must only be called from `queue` (via `queue.sync`/`queue.async`); see the type doc above.
    func snapshot() -> ExporterContextSnapshot {
        ExporterContextSnapshot(
            lastCombatPrediction: lastCombatPrediction,
            offeredTrinketEntityIds: offeredTrinketEntityIds,
            trinketKindByCardId: trinketKindByCardId,
            comps: comps,
            heroPickStats: heroPickStats,
            trinketPickStats: trinketPickStats
        )
    }
}

/// An immutable, `Sendable` copy of the `ExporterContext` fields SnapshotBuilder needs, taken at a
/// single instant on `queue`. Safe to read from any thread — in particular, the funnel thread that
/// builds the GameSnapshot outside of `queue` (F3).
struct ExporterContextSnapshot {
    let lastCombatPrediction: CombatPrediction?
    let offeredTrinketEntityIds: [Int]
    let trinketKindByCardId: [String: TrinketKind]
    let comps: [BattlegroundsCompStats.LobbyComp]?
    let heroPickStats: [BattlegroundsHeroPickStats.BattlegroundsSingleHeroPickStats]?
    let trinketPickStats: [BattlegroundsTrinketPickStats.BattlegroundsSingleTrinketPickStats]?

    func kind(forCardId cardId: String) -> TrinketKind {
        trinketKindByCardId[cardId] ?? .lesser
    }
}

final class SnapshotExporter {
    static let shared = SnapshotExporter()

    /// Owns ALL mutable exporter bookkeeping: `ctx` (see ExporterContext's doc comment) plus every
    /// `private var` declared below (`lastHash` through `latestLine`). Everything on `queue` reads
    /// or writes plain value types once handed a payload, so debounce/hash bookkeeping stays
    /// race-free even though the GameSnapshot that feeds it was built elsewhere.
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

    // Debounce bookkeeping: when a non-forced emit lands inside the minimum interval, we no longer
    // re-read `game` later from `queue` to "catch up" (that would reintroduce the very race F3
    // fixes). Instead we remember the latest already-built candidate and flush *that* once the
    // window closes — still confined to `queue`, just no second Game read.
    private var pendingTrailingEmit: DispatchWorkItem?
    private var pendingTrailingSnapshot: GameSnapshot?
    private var pendingTrailingData: Data?
    private var pendingTrailingHash: Int?

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

    // MARK: - Entry points
    //
    // Every entry point here (except onBobsBuddyResult) builds and encodes the GameSnapshot
    // synchronously on the calling thread — see the file-level doc comment (F3).

    func emitIfChanged(game: Game) {
        emit(game: game, forced: false)
    }

    func onTurnStart(game: Game) {
        // Turn rollover always ends a trinket offer (mirrors HSTracker's own viewModel reset).
        queue.sync { self.ctx.clearOfferedTrinkets() }
        emit(game: game, forced: true)
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
            self.pendingTrailingSnapshot = nil
            self.pendingTrailingData = nil
            self.pendingTrailingHash = nil
            self.latestLine = nil
        }
    }

    /// BACONBRAIN (Codex review F3 carve-out): unlike every other hook in this file, this one is
    /// invoked with a *foreign Mono runtime thread* attached (see
    /// BobsBuddyInvoker.runAndDisplaySimulationAsync, which calls mono_thread_attach around this
    /// call and detaches right after). Building a GameSnapshot here — walking board/hand/shop/
    /// entities — would hold that thread far longer than the scalar extraction the review requires
    /// ("must not hold the mono thread longer than scalar extraction"). So this hook keeps its
    /// pre-fix shape: extract plain scalars now, then hop onto `queue` immediately and do the
    /// (Game-graph-reading) build there, exactly as before this fix.
    func onBobsBuddyResult(
        winRate: Float, tieRate: Float, lossRate: Float,
        myDeathRate: Float, theirDeathRate: Float,
        damageResults: [Int32], game: Game
    ) {
        let damageTaken = damageResults.filter { $0 < 0 }.map { Double(-$0) }
        // F4 (Codex review fix): HSTracker's own BobsBuddyPanel (setAverageDamage) splits
        // `possibleResults` the same way — negative entries are damage the *player* took, i.e.
        // losing-outcome damage — but it then displays a 20th-to-80th-percentile *range*
        // (getTwentiethAndEightiethPercentileFor), not a mean. BaconbrainKit's contract requires a
        // single Double, so avgDamageTaken is the arithmetic mean over that same losing-outcome
        // population (matching HSTracker's population/sign split; it is not the identical
        // percentile-range statistic HSTracker's panel renders, since that isn't representable as
        // one scalar).
        let avgDamageTaken = damageTaken.isEmpty ? 0 : damageTaken.reduce(0, +) / Double(damageTaken.count)
        // Lethal naming: we kill them = theirDeathRate; BobsBuddyPanel passes playerLethal:
        // theirDeathRate, so myLethalPct=theirDeathRate / theirLethalPct=myDeathRate (§8).
        let prediction = CombatPrediction(
            winPct: Double(winRate),
            tiePct: Double(tieRate),
            lossPct: Double(lossRate),
            avgDamageTaken: avgDamageTaken,
            theirLethalPct: Double(myDeathRate),
            myLethalPct: Double(theirDeathRate)
        )
        queue.async { [weak self] in
            guard let self else { return }
            self.ctx.lastCombatPrediction = prediction
            self.emitOnQueue(game: game, forced: true)
        }
    }

    func onTrinketOffer(offered: [Entity], game: Game) {
        // F2 (Codex review fix): this only declares the offer (and force-emits with stats
        // nil/absent); the caller fetches Tier7 stats separately and calls onTrinketPickStats once
        // they resolve, so a slow/hung request never delays this time-limited decision's snapshot.
        queue.sync { self.ctx.setOfferedTrinkets(offered) }
        emit(game: game, forced: true)
    }

    /// F2 (Codex review fix): companion to onTrinketOffer — called once the (possibly slow) Tier7
    /// trinket-pick request resolves, to cache the stats and re-emit. Not forced: the resulting
    /// GameSnapshot's hsreplay.trinketPick differs (nil/stale vs freshly populated), so the hash
    /// comparison in finishEmit already guarantees a real change gets sent; forcing isn't needed.
    func onTrinketPickStats(
        _ stats: [BattlegroundsTrinketPickStats.BattlegroundsSingleTrinketPickStats],
        game: Game
    ) {
        queue.sync { self.ctx.trinketPickStats = stats }
        emit(game: game, forced: false)
    }

    func onTrinketOfferEnded(game: Game) {
        queue.sync { self.ctx.clearOfferedTrinkets() }
        emit(game: game, forced: true)
    }

    func onCompStats(_ comps: [BattlegroundsCompStats.LobbyComp], game: Game) {
        queue.sync { self.ctx.comps = comps }
        emit(game: game, forced: false)
    }

    func onHeroPickStats(_ stats: [BattlegroundsHeroPickStats.BattlegroundsSingleHeroPickStats], game: Game) {
        queue.sync { self.ctx.heroPickStats = stats }
        emit(game: game, forced: false)
    }

    // MARK: - Emit pipeline

    /// Builds and encodes synchronously on the calling (funnel) thread — the live Game/entity
    /// graph is only ever read here, never after an async hop — then hands the immutable result to
    /// `queue` for hashing/debounce/send.
    private func emit(game: Game, forced: Bool) {
        guard !game.spectator else { return }
        let ctxSnapshot = queue.sync { self.ctx.snapshot() }
        guard let snapshot = SnapshotBuilder.build(game: game, ctx: ctxSnapshot) else { return }
        guard let data = try? encoder.encode(snapshot) else { return }
        queue.async { [weak self] in
            self?.finishEmit(snapshot: snapshot, data: data, forced: forced)
        }
    }

    /// Same pipeline as `emit(game:forced:)`, but for callers already running on `queue` (only
    /// onBobsBuddyResult; see its doc comment for why it can't build on its own calling thread).
    private func emitOnQueue(game: Game, forced: Bool) {
        guard !game.spectator else { return }
        let ctxSnapshot = ctx.snapshot()
        guard let snapshot = SnapshotBuilder.build(game: game, ctx: ctxSnapshot) else { return }
        guard let data = try? encoder.encode(snapshot) else { return }
        finishEmit(snapshot: snapshot, data: data, forced: forced)
    }

    /// Queue-confined: hash/debounce bookkeeping plus the final broadcast/sink. Takes only
    /// already-built, immutable values — no Game/entity access happens here.
    private func finishEmit(snapshot: GameSnapshot, data: Data, forced: Bool) {
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
            scheduleTrailingEmit(snapshot: snapshot, data: data, hash: hash)
            return
        }

        commitEmit(snapshot: snapshot, data: data, hash: hash)
    }

    private func scheduleTrailingEmit(snapshot: GameSnapshot, data: Data, hash: Int) {
        pendingTrailingEmit?.cancel()
        pendingTrailingSnapshot = snapshot
        pendingTrailingData = data
        pendingTrailingHash = hash

        let deadline = lastEmitAt + Self.minEmitInterval
        let workItem = DispatchWorkItem { [weak self] in
            guard let self else { return }
            guard let snapshot = self.pendingTrailingSnapshot,
                  let data = self.pendingTrailingData,
                  let hash = self.pendingTrailingHash else { return }
            self.commitEmit(snapshot: snapshot, data: data, hash: hash)
        }
        pendingTrailingEmit = workItem
        queue.asyncAfter(deadline: deadline, execute: workItem)
    }

    private func commitEmit(snapshot: GameSnapshot, data: Data, hash: Int) {
        pendingTrailingEmit?.cancel()
        pendingTrailingEmit = nil
        pendingTrailingSnapshot = nil
        pendingTrailingData = nil
        pendingTrailingHash = nil

        lastHash = hash
        lastEmitAt = .now()
        lastSentTurn = snapshot.turn
        lastSentPhase = snapshot.phase
        send(data: data)
    }

    private func send(data: Data) {
        var line = data
        line.append(0x0A) // "\n" — NDJSON frame terminator
        latestLine = line
        transport.broadcast(line)
        sink.append(line)
    }
}
