//
//  TravelSecurity.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon a random 8-Cost minion."
class TravelSecurity: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.TravelSecurity }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
