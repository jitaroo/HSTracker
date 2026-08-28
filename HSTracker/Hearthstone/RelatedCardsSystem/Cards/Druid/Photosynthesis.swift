//
//  Photosynthesis.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Restore 6 Health. Get 3 random Druid spells."
class Photosynthesis: DruidSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.Photosynthesis }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }
}
