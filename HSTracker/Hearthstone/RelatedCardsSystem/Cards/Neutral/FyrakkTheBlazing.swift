//
//  FyrakkTheBlazing.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Immune to Fire spells. Battlecry: Cast 15 Mana worth of Fire spells at random enemies."
// The number of casts is unpredictable (depends on rolled spell costs), so it is modeled
// as a single representative draw. Fire spell pool + ICardGenerator conformance
// inherited from FireSpellPool.
class FyrakkTheBlazing: FireSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.FyrakkTheBlazing }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
