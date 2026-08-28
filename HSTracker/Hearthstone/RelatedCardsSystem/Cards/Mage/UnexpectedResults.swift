//
//  UnexpectedResults.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 2-Cost minions (improved by Spell Damage)."
class UnexpectedResults: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.UnexpectedResults }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
