//
//  FinalFrontier.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 10-Cost minion from the past. Set its Cost to (1)."
class FinalFrontier: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.FinalFrontier }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 10 }
    }
}
