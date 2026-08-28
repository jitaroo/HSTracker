//
//  SlimeEm.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Destroy all minions. Each player gets a 3-Cost spell that resummons theirs."
class SlimeEm: ICardWithRelatedCards {
    private let token: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Priest.Slimeem_EctoplasmToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Priest.SlimeEm
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        token
    }
}
