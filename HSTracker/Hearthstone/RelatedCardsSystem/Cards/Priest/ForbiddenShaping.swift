//
//  ForbiddenShaping.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spend all your Mana. Summon a random minion that costs that much."
class ForbiddenShaping: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.ForbiddenShaping }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return max(RelativeCostPoolCard.remainingMana(player: player) - RelativeCostPoolCard.hoveredCost(hoveredEntity: hoveredEntity, cardId: getCardId()), 0)
    }
}
