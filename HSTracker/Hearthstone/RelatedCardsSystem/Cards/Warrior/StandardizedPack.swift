//
//  StandardizedPack.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 5 random Taunt minions to your hand. They are Temporary."
class StandardizedPack: TauntMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.StandardizedPack }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 5 }
}
