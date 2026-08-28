//
//  InFormation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 2 random Taunt minions to your hand."
class InFormation: TauntMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.InFormation }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
