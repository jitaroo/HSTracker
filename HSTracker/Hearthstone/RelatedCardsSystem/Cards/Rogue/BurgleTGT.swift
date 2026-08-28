//
//  BurgleTGT.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get 3 random cards (from your opponent's class)."
// Another-class pool inherited from Swashburglar. Known approximation: the real pool is
// the opponent's class specifically; the static cache can only express "any other class".
class BurgleTGT: OffClassCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.BurgleTGT }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 3 }
}

class BurgleWONDERS: BurgleTGT {
    override func getCardId() -> String { CardIds.Collectible.Rogue.BurgleWONDERS }
}
