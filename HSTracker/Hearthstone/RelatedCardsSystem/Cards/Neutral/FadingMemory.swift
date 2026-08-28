//
//  FadingMemory.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random 5-Cost minion from the past."
class FadingMemory: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.FadingMemory }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 5 }
    }
}
