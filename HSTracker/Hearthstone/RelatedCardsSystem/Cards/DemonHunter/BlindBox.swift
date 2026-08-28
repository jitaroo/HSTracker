//
//  BlindBox.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get 2 random Demons. Outcast: Discover them instead."
class BlindBox: DemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.BlindBox }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
