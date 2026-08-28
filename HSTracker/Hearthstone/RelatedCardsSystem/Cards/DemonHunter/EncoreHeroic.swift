//
//  EncoreHeroic.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get a random Outcast card."
class EncoreHeroic: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.EncoreHeroic }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.mechanics.contains("OUTCAST") }
    }
}
