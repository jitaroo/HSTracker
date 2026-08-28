//
//  Dethrone.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Destroy a minion. Combo: Summon a random 8-Cost minion."
class Dethrone: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Dethrone }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
