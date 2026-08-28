//
//  Malkorok.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Equip a random weapon."
class Malkorok: WeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.Malkorok }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
