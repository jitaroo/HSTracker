//
//  ChaosCreation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $6 damage. Summon a random 6-Cost minion. Destroy the bottom 6 cards of your deck."
class ChaosCreation: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.ChaosCreation }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
