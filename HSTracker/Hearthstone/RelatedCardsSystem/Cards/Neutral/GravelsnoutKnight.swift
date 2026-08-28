//
//  GravelsnoutKnight.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random 1-Cost minion for your opponent."
class GravelsnoutKnight: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GravelsnoutKnight }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
