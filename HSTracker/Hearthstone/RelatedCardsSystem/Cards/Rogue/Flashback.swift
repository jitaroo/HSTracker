//
//  Flashback.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 1-Cost minions from the past. Combo: With +1 Attack."
class Flashback: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Flashback }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 1 }
    }
}
