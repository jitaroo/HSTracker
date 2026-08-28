//
//  ApexisBlast.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $5 damage. If your deck has no minions, summon a random 5-Cost minion."
class ApexisBlast: Cost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.ApexisBlast }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
