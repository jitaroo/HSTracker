//
//  UndercityHucksterOG.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random card (from your opponent's class)."
// Known approximation: the real pool is the opponent's class specifically; the static
// cache can only express "any other class".
class UndercityHucksterOG: OffClassCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.UndercityHucksterOG }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class UndercityHucksterCorePlaceholder: UndercityHucksterOG {
    override func getCardId() -> String { CardIds.Collectible.Rogue.UndercityHucksterCorePlaceholder }
}
