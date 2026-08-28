//
//  ScrappyScavenger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a card with Cost equal to your remaining Mana Crystals." Discover
// of "a card" -> class + Neutral scoping, any playable card type.
class ScrappyScavenger: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.ScrappyScavenger }
    override var batchSize: Int { 3 }
    override var isWithReplacement: Bool { false }
    override func isInPool(_ card: Card) -> Bool {
        card.type == .minion || card.type == .spell || card.type == .weapon || card.type == .location
    }
    override var poolCacheKey: String { "cards" }

    override func filterPoolForPlayer(_ pool: [Card], player: Player) -> [Card] {
        return pool.filter { $0.isClassOrNeutral(player.currentClass) }
    }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return max(RelativeCostPoolCard.remainingMana(player: player) - RelativeCostPoolCard.hoveredCost(hoveredEntity: hoveredEntity, cardId: getCardId()), 0)
    }
}
