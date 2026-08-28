//
//  ForbiddenShrine.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spend all your Mana. Cast a random spell that costs that much."
class ForbiddenShrine: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.ForbiddenShrine }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return max(RelativeCostPoolCard.remainingMana(player: player) - RelativeCostPoolCard.hoveredCost(hoveredEntity: hoveredEntity, cardId: getCardId()), 0)
    }
}
