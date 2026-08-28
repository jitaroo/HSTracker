//
//  FlintFirearm.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random Quickdraw card. If you play it this turn, repeat this."
class FlintFirearm: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.FlintFirearm }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.mechanics.contains("QUICKDRAW") }
    }
}
