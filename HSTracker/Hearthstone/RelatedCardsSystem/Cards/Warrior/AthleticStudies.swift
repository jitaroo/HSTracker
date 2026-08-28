//
//  AthleticStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Rush minion. Your next one costs (1) less."
class AthleticStudies: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.AthleticStudies }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.mechanics.contains("RUSH")
        }
    }
}
