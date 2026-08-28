//
//  Pyrotechnician.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you cast a spell, add a random Fire spell to your hand."
// Fire spell pool + ICardGenerator conformance inherited from FireSpellPool.
class Pyrotechnician: FireSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Pyrotechnician }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
