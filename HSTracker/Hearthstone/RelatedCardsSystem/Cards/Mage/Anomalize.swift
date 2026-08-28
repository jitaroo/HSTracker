//
//  Anomalize.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 10 and 1-Cost minion. Scramble their stats."
class Anomalize: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.Anomalize }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && ($0.cost == 1 || $0.cost == 10) }
    }
}
