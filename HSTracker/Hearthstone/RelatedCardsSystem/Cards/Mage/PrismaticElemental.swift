//
//  PrismaticElemental.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell from any class. It costs (1) less."
// Standard Discover sampling.
class PrismaticElemental: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.PrismaticElemental }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 1 }
    override func isWithReplacement() -> Bool { false }
}
