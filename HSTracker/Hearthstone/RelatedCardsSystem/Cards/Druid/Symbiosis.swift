//
//  Symbiosis.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Choose One card from another class."
// "From another class" explicitly excludes the player's class and neutral cards.
class Symbiosis: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.Symbiosis }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            !$0.isClassOrNeutral(playerClass) && $0.mechanics.contains("CHOOSE_ONE")
        }
    }
}
