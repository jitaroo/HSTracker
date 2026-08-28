//
//  GeniusOfMimiron.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, summon a random 4-Cost minion."
class GeniusOfMimironToken2: Cost4MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.GeniusOfMimironToken2 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
