//
//  DiscJockey.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Combo: Add a random Combo card to your hand."
class DiscJockey: ComboCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.DiscJockey }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
