//
//  HemetFoamMarksman.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After a friendly Beast dies, get a random Legendary Beast from the past. It costs (2) less."
class HemetFoamMarksman: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.HemetFoamMarksman }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.rarity == .legendary && $0.isBeast() }
    }
}
