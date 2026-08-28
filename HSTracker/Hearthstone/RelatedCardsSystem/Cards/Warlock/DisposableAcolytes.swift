//
//  DisposableAcolytes.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "When you play or discard this, summon two random 1-Cost minions."
class DisposableAcolytes: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DisposableAcolytes }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
