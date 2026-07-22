//
//  BaconbrainHooks.swift
//  HSTracker
//
//  BACONBRAIN: hook seam between upstream HSTracker call sites and the exporter.
//

import Foundation

/// Semantic seam between upstream HSTracker code and the Baconbrain exporter.
/// Upstream call sites invoke these hooks instead of `SnapshotExporter.shared`
/// directly, so upstream merges only ever touch one-line hook calls.
/// Each hook forwards synchronously and unconditionally — no state, no queues,
/// no transformations.
enum BaconbrainHooks {
    /// Application/tracker startup: binds the exporter's listener.
    static func applicationDidStart() {
        SnapshotExporter.shared.start()
    }

    /// Game state changed (called from Game.updateAll).
    static func gameStateDidChange(game: Game) {
        SnapshotExporter.shared.emitIfChanged(game: game)
    }

    /// Game reset: clears the exporter's per-game caches.
    static func gameDidReset(gameId: String) {
        SnapshotExporter.shared.onGameReset(gameId: gameId)
    }

    /// Battlegrounds recruit (shopping) turn started.
    static func recruitTurnDidStart(game: Game) {
        SnapshotExporter.shared.onTurnStart(game: game)
    }

    /// Tier7 hero-pick stats loaded.
    static func heroPickStatsDidLoad(_ stats: [BattlegroundsHeroPickStats.BattlegroundsSingleHeroPickStats], game: Game) {
        SnapshotExporter.shared.onHeroPickStats(stats, game: game)
    }

    /// Trinket offer appeared.
    static func trinketOfferDidAppear(offered: [Entity], game: Game) {
        SnapshotExporter.shared.onTrinketOffer(offered: offered, game: game)
    }

    /// Tier7 trinket-pick stats loaded.
    static func trinketPickStatsDidLoad(_ stats: [BattlegroundsTrinketPickStats.BattlegroundsSingleTrinketPickStats], game: Game) {
        SnapshotExporter.shared.onTrinketPickStats(stats, game: game)
    }

    /// Trinket offer ended (choices no longer visible).
    static func trinketOfferDidEnd(game: Game) {
        SnapshotExporter.shared.onTrinketOfferEnded(game: game)
    }

    /// Bob's Buddy simulation completed. Callers must pass already-extracted
    /// scalar values — never a Mono proxy.
    static func bobsBuddySimulationDidComplete(
        winRate: Float, tieRate: Float, lossRate: Float,
        myDeathRate: Float, theirDeathRate: Float,
        damageResults: [Int32], game: Game
    ) {
        SnapshotExporter.shared.onBobsBuddyResult(
            winRate: winRate, tieRate: tieRate, lossRate: lossRate,
            myDeathRate: myDeathRate, theirDeathRate: theirDeathRate,
            damageResults: damageResults, game: game
        )
    }

    /// Tier7 composition stats loaded.
    static func compStatsDidLoad(_ comps: [BattlegroundsCompStats.LobbyComp], game: Game) {
        SnapshotExporter.shared.onCompStats(comps, game: game)
    }
}
