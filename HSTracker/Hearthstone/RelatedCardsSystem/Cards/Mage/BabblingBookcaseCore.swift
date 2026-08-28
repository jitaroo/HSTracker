//
//  BabblingBookcaseCore.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add 2 random Mage spells to your hand."
class BabblingBookcaseCore: MageSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.BabblingBookcaseCore }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
