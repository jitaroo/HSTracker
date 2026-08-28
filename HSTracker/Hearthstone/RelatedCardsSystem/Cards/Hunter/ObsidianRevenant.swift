//
//  ObsidianRevenant.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon two random Deathrattle minions that cost (3) or less."
class ObsidianRevenant: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.ObsidianRevenant }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost <= 3 && $0.hasDeathrattle() }
    }
}
