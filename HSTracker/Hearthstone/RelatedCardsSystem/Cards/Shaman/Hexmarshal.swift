//
//  Hexmarshal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random spell that costs (5) or more. If your deck started with no spells, it costs (5) less."
class Hexmarshal: CostAtLeast5SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Hexmarshal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
