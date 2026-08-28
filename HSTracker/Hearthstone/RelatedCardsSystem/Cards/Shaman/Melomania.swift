//
//  Melomania.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each time you play a minion this turn, add a random Shaman spell to your hand."
class Melomania: ShamanSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Melomania }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
