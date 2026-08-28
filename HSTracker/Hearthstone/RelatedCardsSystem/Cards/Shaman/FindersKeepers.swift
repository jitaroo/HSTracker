//
//  FindersKeepers.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a card with Overload. Overload: (1)"
class FindersKeepers: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.FindersKeepers }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.isClassOrNeutral(playerClass) && $0.mechanics.contains("OVERLOAD")
        }
    }
}
