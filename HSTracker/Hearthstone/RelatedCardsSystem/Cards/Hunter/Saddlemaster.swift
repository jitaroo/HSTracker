//
//  Saddlemaster.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you play a Beast, add a random Beast to your hand."
class Saddlemaster: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Saddlemaster }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
