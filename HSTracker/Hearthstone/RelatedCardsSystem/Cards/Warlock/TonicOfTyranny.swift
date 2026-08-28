//
//  TonicOfTyranny.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a Voidlord." (non-collectible, one of Godfather Kazakus' trial options)
class TonicOfTyranny: ICardWithRelatedCards {
    private let token: [Card?] = [
        Cards.any(byId: CardIds.Collectible.Warlock.Voidlord)
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.NonCollectible.Warlock.GodfatherKazakus_TonicOfTyrannyToken
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        token
    }
}
