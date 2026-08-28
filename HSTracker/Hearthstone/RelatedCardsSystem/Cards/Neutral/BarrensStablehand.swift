//
//  BarrensStablehand.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random Beast."
class BarrensStablehand: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BarrensStablehandLegacy }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isBeast() }
    }
}

class BarrensStablehandCore: BarrensStablehand {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BarrensStablehandCorePlaceholder }
}
