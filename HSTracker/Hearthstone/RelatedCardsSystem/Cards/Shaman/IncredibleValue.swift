//
//  IncredibleValue.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 4-Cost minion. Set its Attack and Health to 7."
class IncredibleValue: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.IncredibleValue }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost == 4 && $0.isClassOrNeutral(playerClass)
        }
    }
}
