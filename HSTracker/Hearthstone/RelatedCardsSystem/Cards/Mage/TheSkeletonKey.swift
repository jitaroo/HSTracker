//
//  TheSkeletonKey.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell, or refresh your options (20% chance to take 5 damage each refresh!)"
class TheSkeletonKey: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.TheSkeletonKey }
}
