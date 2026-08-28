//
//  BuildingBlockGolem.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rush. Deathrattle: Summon three random 1-Cost minions."
class BuildingBlockGolem: GravelsnoutKnight {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BuildingBlockGolem }
    override func eventCount() -> Int { 3 }
}
