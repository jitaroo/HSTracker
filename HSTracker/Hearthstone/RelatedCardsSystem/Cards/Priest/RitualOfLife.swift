//
//  RitualOfLife.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 3-Cost minion. Summon a 2/3 copy of it."
class RitualOfLife: ClassOrNeutralCost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.RitualOfLife }
}
