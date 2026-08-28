//
//  DragonTales.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose One - Get two random Dragons that cost (5) or less; or Get two that cost more than (5)."
class DragonTales: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.DragonTales }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
