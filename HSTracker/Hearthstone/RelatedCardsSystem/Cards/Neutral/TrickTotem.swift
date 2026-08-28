//
//  TrickTotem.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, cast a random spell that costs (3) or less."
class TrickTotem: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.TrickTotem }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.cost <= 3 }
    }
}
