//
//  PilotedSkyGolem.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random 4-Cost minion."
class PilotedSkyGolem: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.PilotedSkyGolem }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
