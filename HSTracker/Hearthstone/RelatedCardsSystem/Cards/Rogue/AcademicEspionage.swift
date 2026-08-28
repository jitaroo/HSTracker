//
//  AcademicEspionage.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Shuffle 10 cards from your opponent's class into your deck. They cost (1)."
// Known approximation: the real pool is the opponent's class specifically; the static
// cache can only express "any other class".
class AcademicEspionage: OffClassCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.AcademicEspionage }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 10 }
}
