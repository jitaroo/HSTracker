//
//  CaptainCrowley.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Your Cannoneers fire an additional shot. Battlecry: Summon two 1/1 Cannoneers."
class CaptainCrowley: ICardWithRelatedCards {
    // Two tiles on purpose: the Battlecry summons two Cannoneers.
    private let tokens: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken),
        Cards.any(byId: CardIds.NonCollectible.Warrior.Cannonmaster_CannoneerToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Warrior.CaptainCrowley
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        tokens
    }
}
