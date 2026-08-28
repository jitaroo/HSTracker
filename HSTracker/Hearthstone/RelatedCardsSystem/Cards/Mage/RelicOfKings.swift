//
//  RelicOfKings.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell from any class that costs (8) or more. It costs (1)."
class RelicOfKings: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.RelicOfKings }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.cost >= 8 }
    }
}
