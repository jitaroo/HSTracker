//
//  HandCannon.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, your Cannoneers FIRE!"
class HandCannon: ICardWithRelatedCards {
    // The weapon summons nothing; the single tile names the token it works with.
    private let token: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Warrior.HandCannon
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        token
    }
}
