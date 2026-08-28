//
//  WardOfEarth.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Gain 5 Armor. Summon a random 5-Cost minion and give it Taunt."
class WardOfEarth: Cost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.WardOfEarth }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
