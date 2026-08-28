//
//  IronforgePortalKARA.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Gain 4 Armor. Summon a random 4-Cost minion."
class IronforgePortalKARA: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IronforgePortalKARA }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class IronforgePortalCore: IronforgePortalKARA {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IronforgePortalCore }
}

class IronforgePortalWONDERS: IronforgePortalKARA {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IronforgePortalWONDERS }
}
