//
//  ConcealingConfection.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random weapon."
class ConcealingConfection: WeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ConcealingConfection }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
