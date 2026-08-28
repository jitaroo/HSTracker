//
//  TheSunwell.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your hand with random spells. Costs (1) less for each other card in your hand."
class TheSunwell: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.TheSunwell }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    // Fills the hand with an unpredictable number of spells; model as a single representative draw.
    override func eventCount() -> Int { 1 }
}
