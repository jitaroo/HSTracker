//
//  CoilfangElite.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rush After this attacks, summon a Neutral Murloc."
class CoilfangEliteToken: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.CoilfangEliteToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isMurloc() && $0.isClass(cardClass: .neutral)
        }
    }
}
