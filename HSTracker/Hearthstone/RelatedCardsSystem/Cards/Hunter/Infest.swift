//
//  Infest.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give your minions 'Deathrattle: Add a random Beast to your hand.'"
class Infest: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Infest }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
