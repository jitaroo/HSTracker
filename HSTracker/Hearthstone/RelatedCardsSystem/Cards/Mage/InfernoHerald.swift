//
//  InfernoHerald.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you cast a Fire spell, get a random Elemental and reduce its Cost by (3)."
class InfernoHerald: ElementalMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.InfernoHerald }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
