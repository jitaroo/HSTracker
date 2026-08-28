//
//  DeckOfWonders.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Casts When Drawn. Cast a random spell."
class ScrollOfWonderToken: SpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.Mage.DeckofWonders_ScrollOfWonderToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}

// "Shuffle 5 Scrolls into your deck. When drawn, cast a random spell."
class DeckOfWonders: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.DeckOfWonders }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }
}
