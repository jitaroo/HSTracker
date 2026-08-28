//
//  WildernessPack.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 5 random Beasts to your hand. They are Temporary."
class WildernessPack: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.WildernessPack }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }
}
