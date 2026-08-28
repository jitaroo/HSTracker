//
//  ChaoticTendril.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Cast a random 1-Cost spell. Improve your future Chaotic Tendrils."
// ChaoticTendrilCounter holds how many have been played; the next one casts a
// (count + 1)-Cost spell, capped at 10.
class ChaoticTendril: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ChaoticTendril }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        let counter: ChaoticTendrilCounter? = RelativeCostPoolCard.getCounter(player: player)
        return min((counter?.counter ?? 0) + 1, 10)
    }
}
