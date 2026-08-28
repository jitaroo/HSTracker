//
//  DiseasedVulture.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever your hero takes damage on your turn, summon a random 3-Cost minion."
class DiseasedVulture: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DiseasedVulture }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
