//
//  BloodpetalBiome.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Temporary 1-Cost minion."
class BloodpetalBiome: ClassOrNeutralCost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.BloodpetalBiome }
}
