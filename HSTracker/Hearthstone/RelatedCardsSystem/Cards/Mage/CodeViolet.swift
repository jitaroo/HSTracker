//
//  CodeViolet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Prepare. Summon an 8-Cost minion. If you've cast 3 other spells this turn, do it again."
// The repeat is conditional, so eventCount stays 1.
class CodeViolet: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.CodeViolet }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
