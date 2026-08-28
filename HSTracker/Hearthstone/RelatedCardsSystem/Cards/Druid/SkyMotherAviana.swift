//
//  SkyMotherAviana.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Shuffle 10 random Legendary minions into your deck. They cost (1)."
class SkyMotherAviana: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.SkyMotherAviana }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 10 }
    override func isWithReplacement() -> Bool { true }
}
