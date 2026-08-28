//
//  DruidOfRegrowth.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind. Battlecry: Cast 2 random Nature spells."
class DruidOfRegrowth: NatureSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.DruidOfRegrowth }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
