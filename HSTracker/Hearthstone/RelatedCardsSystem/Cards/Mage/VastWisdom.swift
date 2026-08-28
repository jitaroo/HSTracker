//
//  VastWisdom.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover two spells that cost (3) or less. Swap their Costs."
class VastWisdom: ClassOrNeutralCostAtMost3SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.VastWisdom }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }
}
