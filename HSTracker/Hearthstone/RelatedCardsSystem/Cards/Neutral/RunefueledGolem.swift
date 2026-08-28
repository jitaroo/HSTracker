//
//  RunefueledGolem.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a weapon from any class."
class RunefueledGolem: WeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.RunefueledGolem }

    // Discover (not a single random draw), so 3 unique choices from the full weapon pool.
    override func picks() -> Int { 3 }
    override func isWithReplacement() -> Bool { false }
}
