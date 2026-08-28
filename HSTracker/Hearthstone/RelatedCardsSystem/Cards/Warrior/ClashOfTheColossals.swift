//
//  ClashOfTheColossals.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random Colossal minion to both players' hands. Yours costs (2) less."
class ClashOfTheColossals: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.ClashOfTheColossals }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.mechanics.contains("COLOSSAL") }
    }

    // filterGenerationPool drops COLOSSAL cards, which would empty this pool - the whole
    // pool is Colossal minions, so skip the deck-dependent gating entirely.
    override func filterPool(_ pool: [Card], _ deck: [Card]) -> [Card] {
        return pool
    }
}
