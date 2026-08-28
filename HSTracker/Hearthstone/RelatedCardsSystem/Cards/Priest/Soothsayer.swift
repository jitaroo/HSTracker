//
//  Soothsayer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Prepare, Taunt. Deathrattle: Restore 6 Health your hero. Summon a random 6-Cost minion."
class Soothsayer: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.Soothsayer }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
