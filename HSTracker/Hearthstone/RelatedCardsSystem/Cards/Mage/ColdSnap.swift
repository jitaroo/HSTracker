//
//  ColdSnap.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Freeze an enemy. Get a random Frost spell."
class ColdSnap: FrostSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.ColdSnap }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
