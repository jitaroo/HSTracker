//
//  CreatureOfMadness.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 3-Cost minion with a Dark Gift."
class CreatureOfMadness: ClassOrNeutralCost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.CreatureOfMadness }
}
