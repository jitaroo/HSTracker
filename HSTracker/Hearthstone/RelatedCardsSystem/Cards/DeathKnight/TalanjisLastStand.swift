//
//  TalanjisLastStand.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give your minions 'Deathrattle: Summon a random 4-Cost minion.'"
class TalanjisLastStand: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.TalanjisLastStand }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
