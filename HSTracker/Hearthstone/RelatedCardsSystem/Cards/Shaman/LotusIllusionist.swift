//
//  LotusIllusionist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After this minion attacks a hero, transform it into a random 6-Cost minion."
class LotusIllusionist: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.LotusIllusionist }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
