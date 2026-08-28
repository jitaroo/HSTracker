//
//  Cannonmaster.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a 1/1 Cannoneer that deals 1 damage to a random enemy at end of turn."
class Cannonmaster: ICardWithRelatedCards {
    private let token: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Warrior.Cannonmaster
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        token
    }
}
