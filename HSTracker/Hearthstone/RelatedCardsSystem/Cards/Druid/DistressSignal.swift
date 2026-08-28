//
//  DistressSignal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 2-Cost minions. Refresh 2 Mana Crystals."
class DistressSignal: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.DistressSignal }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
