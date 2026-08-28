//
//  MoltenRune.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $3 damage. Get a random spell. Forge: This casts twice."
class MoltenRune: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.MoltenRune }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
