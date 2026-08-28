//
//  AlternateReality.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Replace your hand and deck with random Choose One cards from the past. They cost (1) less."
class AlternateReality: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.AlternateReality }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.mechanics.contains("CHOOSE_ONE") }
    }
}
