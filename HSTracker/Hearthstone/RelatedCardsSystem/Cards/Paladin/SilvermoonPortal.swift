//
//  SilvermoonPortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give a minion +2/+2. Summon a random 2-Cost minion."
class SilvermoonPortalKARA: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SilvermoonPortalKARA }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}

class SilvermoonPortalCore: SilvermoonPortalKARA {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SilvermoonPortalCore }
}

class SilvermoonPortalWONDERS: SilvermoonPortalKARA {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SilvermoonPortalWONDERS }
}
