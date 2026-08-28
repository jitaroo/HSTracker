//
//  WyrmrestPurifier.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform all Neutral cards in your deck into random cards from your class."
class WyrmrestPurifier: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WyrmrestPurifier }

    // Transforms an unpredictable number of deck cards; model as a single representative draw.
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.isClass(cardClass: playerClass) && !$0.isClass(cardClass: .neutral) }
    }
}
