//
//  Wandmaker.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a 1-Cost spell from your class to your hand."
class Wandmaker: PlayerClassCost1SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Wandmaker }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class WandmakerCorePlaceholder: Wandmaker {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WandmakerCorePlaceholder }
}
