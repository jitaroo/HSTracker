//
//  ICardWithDynamicRelatedCardsSummary.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Ported from HDT's ICardWithDynamicRelatedCardsSummary.cs: a related-cards pool whose
// summary depends on live game state - e.g. evolve/devolve effects, where the outcome pool
// is relative to the cost of each affected card. getRelatedCards(player:) (from
// ICardWithRelatedCards) still returns the full, state-independent pool for browsing (the
// user narrows it in the pool panel); the summary is recomputed on every hover from the
// current targets.
protocol ICardWithDynamicRelatedCardsSummary: ICardWithRelatedCards {
    /// Computes the pool summary from the current game state.
    ///
    /// Returns the number of cards the statistics were computed over: the union of the
    /// active cost buckets when targets are known, otherwise the full pool size. When no
    /// targets are known, `statistics` is a non-nil empty-state instance so the summary
    /// window still renders its frame (headers + right-click hint), just without bars,
    /// medians or keywords.
    ///
    /// `hoveredEntity` is the hovered hand entity when known (nil on deck hovers) - cards
    /// whose pool depends on their own live cost or zone read it.
    func computeSummary(player: Player, summary: inout [String: String]?, statistics: inout PoolStatistics?, usePercentages: Bool, hoveredEntity: Entity?, pool: [Card]?) -> Int

    /// The full filtered pool for the card - every possible outcome, before any live-state
    /// narrowing or bucketing. A hover builds the display list and the summary from the same
    /// pool, so callers compute it once here and pass it to both getRelatedCards and
    /// computeSummary, avoiding a second filter-and-dedup pass per hover. `hoveredEntity`
    /// only matters for pools whose contents (not just their narrowing) depend on live
    /// entity state, e.g. a class that swaps each turn; cost-relative pools ignore it.
    func getPool(player: Player, hoveredEntity: Entity?) -> [Card]

    /// Entity-aware variant of ICardWithRelatedCards.getRelatedCards(player:): hand hovers
    /// pass the hovered entity so per-copy state (upgrade tags, discounted costs) selects
    /// the right pool when multiple copies are in hand. Callers without an entity (deck-list
    /// tooltips) use the plain overload, which falls back to the first in-hand copy of the
    /// card. Pass `pool` (from getPool) to reuse an already-built pool; when nil it is
    /// computed on demand.
    func getRelatedCards(player: Player, hoveredEntity: Entity?, pool: [Card]?) -> [Card?]
}
