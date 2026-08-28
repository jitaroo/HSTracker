//
//  Blingtron3000.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Equip a random weapon for each player."
class Blingtron3000: WeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Blingtron3000 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
