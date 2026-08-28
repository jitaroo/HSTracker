//
//  DangerousVariant.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the start of your turn, transform into a random 5-Cost minion."
class DangerousVariant: Cost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DangerousVariant }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
