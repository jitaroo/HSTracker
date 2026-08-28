//
//  Mulch.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Destroy a minion. Add a random minion to your opponent's hand."
class Mulch: MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.Mulch }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
