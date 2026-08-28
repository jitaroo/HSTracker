//
//  CalamitysGrasp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random Outcast card to your hand."
class CalamitysGrasp: OutcastCardPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.CalamitysGrasp }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
