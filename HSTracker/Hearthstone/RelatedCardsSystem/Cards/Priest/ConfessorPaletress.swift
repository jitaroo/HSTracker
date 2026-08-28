//
//  ConfessorPaletress.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry and Inspire: Summon a random Legendary minion."
class ConfessorPaletressTGT: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.ConfessorPaletressTGT }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class ConfessorPaletressWONDERS: ConfessorPaletressTGT {
    override func getCardId() -> String { CardIds.Collectible.Priest.ConfessorPaletressWONDERS }
}
