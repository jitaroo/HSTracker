//
//  Glaciate.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover an 8-Cost minion. Summon and Freeze it."
class Glaciate: ClassOrNeutralCost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Glaciate }
}

class GlaciateCore: Glaciate {
    override func getCardId() -> String { CardIds.Collectible.Shaman.GlaciateCore }
}
