//
//  Supernova.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/27/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//
import Foundation

// "Fill your hand with random Fire spells. They cost (1)."
// Hand-fill count is unpredictable, so it is modeled as a single representative draw.
// Fire spell pool + ICardGenerator conformance inherited from FireSpellPool.
class Supernova: FireSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.Supernova }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
