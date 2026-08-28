//
//  BoneDrake.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random Dragon to your hand."
class BoneDrake: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BoneDrake }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}

class BoneDrakeCorePlaceholder: BoneDrake {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BoneDrakeCorePlaceholder }
}
