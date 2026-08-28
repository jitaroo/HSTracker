//
//  CommissaryCrook.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Prepare Battlecry: Spend all your Mana. Summon a random minion of that Cost." The mana
// spent is what's left after paying for the card itself (live cost when an in-hand copy
// exists, printed cost otherwise).
class CommissaryCrook: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.CommissaryCrook }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return max(RelativeCostPoolCard.remainingMana(player: player) - RelativeCostPoolCard.hoveredCost(hoveredEntity: hoveredEntity, cardId: getCardId()), 0)
    }
}
