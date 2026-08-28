//
//  Blasteroid.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/27/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

// "Battlecry: Shuffle 5 random Fire spells into your deck. They cost (2) less."
// Fire spell pool + ICardGenerator conformance inherited from FireSpellPool.
class Blasteroid: FireSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.Blasteroid }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 5 }
}
