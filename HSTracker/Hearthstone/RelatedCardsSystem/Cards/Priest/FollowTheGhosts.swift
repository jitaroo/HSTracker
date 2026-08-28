//
//  FollowTheGhosts.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a 2/1 Ghost with Reborn. Give a playable card in your hand this effect for a turn."
class FollowTheGhosts: ICardWithRelatedCards {
    private let token: [Card?] = [
        Cards.any(byId: CardIds.NonCollectible.Priest.FollowtheGhosts_SpookyGhostToken)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Priest.FollowTheGhosts
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        token
    }
}
