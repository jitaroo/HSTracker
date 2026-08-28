//
//  ShiftingScroll.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each turn this is in your hand, transform it into a random Mage spell."
class ShiftingScroll: MageSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.ShiftingScroll }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
