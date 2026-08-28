//
//  DigForFreedom.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give a friendly minion 'Deathrattle: Summon two random 4-Cost minions.'"
class DigForFreedom: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.DigForFreedom }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
