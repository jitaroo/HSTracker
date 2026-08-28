//
//  CleverDisguise.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 2 random spells from another class to your hand."
class CleverDisguise: OffClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.CleverDisguise }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
