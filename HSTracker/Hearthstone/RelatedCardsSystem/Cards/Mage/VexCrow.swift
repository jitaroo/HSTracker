//
//  VexCrow.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a spell, summon a random 2-Cost minion."
class VexCrow: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.VexCrow }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
