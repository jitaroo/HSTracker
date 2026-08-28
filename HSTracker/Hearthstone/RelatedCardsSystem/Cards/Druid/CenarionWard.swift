//
//  CenarionWard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Gain 8 Armor. Summon a random 8-Cost minion."
class CenarionWard: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.CenarionWard }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
