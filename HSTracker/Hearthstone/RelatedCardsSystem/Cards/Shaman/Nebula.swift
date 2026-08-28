//
//  Nebula.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover two 8-Cost minions to summon with Taunt and Elusive."
class Nebula: ClassOrNeutralCost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Nebula }
    override func eventCount() -> Int { 2 }
}
