//
//  HologramOperator.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get 3 random Temporary Draenei."
class HologramOperator: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.HologramOperator }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isDraenei() }
    }
}
