//
//  Lifebloom.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Restore 8 Health to all friendly characters. Summon two random 8-Cost minions."
class Lifebloom: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.Lifebloom }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
