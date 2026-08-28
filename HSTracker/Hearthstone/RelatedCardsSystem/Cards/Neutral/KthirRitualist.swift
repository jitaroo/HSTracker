//
//  KthirRitualist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Add a random 4-Cost minion to your opponent's hand."
class KthirRitualist: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.KthirRitualist }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
