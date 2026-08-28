//
//  SpotTheDifference.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 3-Cost minion to summon. If your deck has no minions, repeat this."
// The repeat is conditional.
class SpotTheDifference: ClassOrNeutralCost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.SpotTheDifference }
}
