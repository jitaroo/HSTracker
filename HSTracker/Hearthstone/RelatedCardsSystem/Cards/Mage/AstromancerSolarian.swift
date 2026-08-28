//
//  AstromancerSolarian.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spell Damage +1 Battlecry: Cast 5 random Mage spells (targets enemies if possible)."
class SolarianPrimeToken: MageSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.Mage.AstromancerSolarian_SolarianPrimeToken }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }
}
