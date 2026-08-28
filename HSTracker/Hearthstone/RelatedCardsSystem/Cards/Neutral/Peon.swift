//
//  Peon.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Frenzy: Add a random spell from your class to your hand."
class Peon: PlayerClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Peon }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
