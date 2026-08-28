//
//  ContainmentUnit.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Magnetic. Deathrattle: Summon a random 8-Cost minion."
class ContainmentUnit: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ContainmentUnit }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
