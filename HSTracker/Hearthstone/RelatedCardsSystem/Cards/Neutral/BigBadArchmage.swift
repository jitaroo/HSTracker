//
//  BigBadArchmage.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, summon a random 6-Cost minion."
class BigBadArchmage: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BigBadArchmage }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
