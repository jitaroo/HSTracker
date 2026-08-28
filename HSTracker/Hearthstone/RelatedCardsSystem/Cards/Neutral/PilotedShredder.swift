//
//  PilotedShredder.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random 2-Cost minion."
class PilotedShredder: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.PilotedShredder }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
