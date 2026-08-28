//
//  Magicfin.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After a friendly Murloc dies, add a random Legendary minion to your hand."
class Magicfin: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Magicfin }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
