//
//  TrienniumRex.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Kindred and Deathrattle: Get a random Deathrattle minion. It costs (2) less."
class TrienniumRex: DeathrattleMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.TrienniumRex }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
