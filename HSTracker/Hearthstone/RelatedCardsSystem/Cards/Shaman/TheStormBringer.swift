//
//  TheStormBringer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform your minions into random Legendary minions."
class TheStormBringer: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.TheStormBringer }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
