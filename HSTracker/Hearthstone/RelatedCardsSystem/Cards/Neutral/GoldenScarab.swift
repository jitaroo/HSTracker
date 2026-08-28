//
//  GoldenScarab.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 4-Cost card."
class GoldenScarab: ClassOrNeutralCost4CardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GoldenScarab }
}
