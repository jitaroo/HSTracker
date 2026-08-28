//
//  BloodClone.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 5-Cost minion. Spend 5 Corpses to summon a copy of it."
class BloodClone: ClassOrNeutralCost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.BloodClone }
}
