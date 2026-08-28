//
//  AuspiciousSpirits.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 4-Cost minion. Corrupt: Summon a 7-Cost minion instead."
class AuspiciousSpirits: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.AuspiciousSpirits }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
