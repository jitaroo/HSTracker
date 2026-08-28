//
//  ThreshridersBlessing.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give a friendly minion +4/+4 and 'Deathrattle: Summon a random 4-Cost minion.'"
class ThreshridersBlessing: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.ThreshridersBlessing }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
