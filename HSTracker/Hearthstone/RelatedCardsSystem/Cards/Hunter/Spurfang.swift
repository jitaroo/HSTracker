//
//  Spurfang.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry and Deathrattle: Summon a random Beast with Cost equal to this minion's
// Attack."
class Spurfang: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Spurfang }
    override func isInPool(_ card: Card) -> Bool { card.type == .minion && card.isBeast() }
    override var poolCacheKey: String { "beasts" }

    // In-hand hover reads the live Attack (buffs count); deck hover has no entity, so fall
    // back to the printed Attack.
    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        return hoveredEntity?.attack ?? Cards.by(cardId: getCardId())?.attack
    }
}
