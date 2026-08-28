//
//  Rotface.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After this minion survives damage, summon a random Legendary minion."
class Rotface: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.Rotface }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class RotfaceCorePlaceholder: Rotface {
    override func getCardId() -> String { CardIds.Collectible.Warrior.RotfaceCorePlaceholder }
}
