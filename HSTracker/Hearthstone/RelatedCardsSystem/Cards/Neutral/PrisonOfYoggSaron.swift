//
//  PrisonOfYoggSaron.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose a character. Cast 4 random spells (targeting it if possible)."
class PrisonOfYoggSaron: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.PrisonOfYoggSaron }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 4 }
}
