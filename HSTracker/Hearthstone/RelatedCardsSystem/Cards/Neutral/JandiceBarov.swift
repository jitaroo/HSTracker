//
//  JandiceBarov.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon two random 5-Cost minions. Secretly pick one that dies when it takes damage."
class JandiceBarov: Cost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.JandiceBarov }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
