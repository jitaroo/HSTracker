//
//  LadyPrestor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform minions in your deck into random Dragons. (They keep their original stats and Cost.)"
class LadyPrestor: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.LadyPrestor }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    // Transforms an unpredictable number of deck minions; model as a single representative draw.
    override func eventCount() -> Int { 1 }
}
