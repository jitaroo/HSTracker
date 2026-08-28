//
//  Stampede.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each time you play a Beast this turn, add a random Beast to your hand."
class Stampede: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Stampede }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
