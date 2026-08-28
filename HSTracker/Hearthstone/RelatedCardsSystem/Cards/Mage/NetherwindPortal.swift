//
//  NetherwindPortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: After your opponent casts a spell, summon a random 4-Cost minion."
class NetherwindPortal: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.NetherwindPortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
