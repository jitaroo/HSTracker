//
//  UnknownVoyager.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After this survives damage, transform into a random 7-Cost minion."
class UnknownVoyager: Cost7MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.UnknownVoyager }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
