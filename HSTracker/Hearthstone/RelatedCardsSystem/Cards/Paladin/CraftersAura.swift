//
//  CraftersAura.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, summon a random 6-Cost minion. Lasts 3 turns."
class CraftersAura: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.CraftersAura }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 3 }
}
