//
//  AzsharasTriumph.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Shuffle 5 random minions into your deck that cost (8) or more. Double their stats."
class AzsharasTriumph: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.AzsharasTriumph }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost >= 8 }
    }
}
