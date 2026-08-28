//
//  StateValuePoolCard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Ported from HDT's StateValuePoolCard.cs: a RelativeCostPoolCard whose outcome is a
// single cost bucket computed from live game state - a counter, remaining mana, hand size,
// an entity tag.
//
// Unlike evolve-style pools, the related-cards list (and thus the right-click pool panel)
// is pre-filtered to the same bucket the summary uses; the full pool only shows when the
// bucket can't be resolved. Because getRelatedCards(player:) never receives the hovered
// entity, it looks up the player's in-hand copy by card id so the panel reflects the same
// live entity state (upgrade tags, discounted costs) as the summary.
class StateValuePoolCard: RelativeCostPoolCard {
    override var costOffset: Int { 0 }

    /// The bucket cost for the current state, or nil when it can't be known (no counter, no
    /// corpses, opponent side) - yielding the empty-state summary and the full pool.
    func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        fatalError("Must override targetCost(player:hoveredEntity:)")
    }

    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        guard let cost = targetCost(player: player, hoveredEntity: hoveredEntity) else {
            return []
        }
        return [(cost, 0)]
    }

    override func getRelatedCards(player: Player) -> [Card?] {
        let hoveredEntity = player.hand.first { $0.cardId == getCardId() }
        return getRelatedCards(player: player, hoveredEntity: hoveredEntity, pool: nil)
    }

    override func getRelatedCards(player: Player, hoveredEntity: Entity?, pool: [Card]? = nil) -> [Card?] {
        let pool = pool ?? getPool(player: player, hoveredEntity: hoveredEntity)

        guard let cost = targetCost(player: player, hoveredEntity: hoveredEntity) else {
            return pool.map { $0 as Card? }
        }

        var byCost = [Int: [Card]]()
        for card in pool {
            byCost[card.cost, default: []].append(card)
        }
        guard let bucket = RelativeCostPoolCard.resolveBucket(byCost: byCost, desired: cost, offset: 0) else {
            return pool.map { $0 as Card? }
        }
        return (byCost[bucket] ?? []).map { $0 as Card? }
    }
}
