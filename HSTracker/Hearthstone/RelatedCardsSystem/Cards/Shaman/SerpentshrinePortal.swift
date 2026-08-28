//
//  SerpentshrinePortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $3 damage. Summon a random 3-Cost minion. Overload: (1)"
class SerpentshrinePortal: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.SerpentshrinePortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
