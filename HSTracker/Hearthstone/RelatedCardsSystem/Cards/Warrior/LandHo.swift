//
//  LandHo.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Draw 2 cards. Summon two 1/1 Cannoneers."
class LandHo: ICardWithRelatedCards {
    // Two tiles on purpose: the card summons two Cannoneers.
    private let tokens: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken),
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Warrior.LandHo
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        tokens
    }
}
