//
//  WarCacheCorePlaceholder.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random Warrior minion, spell, and weapon to your hand."
class WarCacheCorePlaceholder: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.WarCacheCorePlaceholder }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let minions = all.filter { $0.type == .minion && $0.isClass(cardClass: .warrior) }
        let spells = all.filter { $0.type == .spell && $0.isClass(cardClass: .warrior) }
        let weapons = all.filter { $0.type == .weapon && $0.isClass(cardClass: .warrior) }
        return minions + spells + weapons
    }
}

class WarCacheLegacy: WarCacheCorePlaceholder {
    override func getCardId() -> String { CardIds.Collectible.Warrior.WarCacheLegacy }
}
