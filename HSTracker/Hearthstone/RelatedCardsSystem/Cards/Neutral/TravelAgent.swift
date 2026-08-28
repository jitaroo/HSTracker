//
//  TravelAgent.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a location from any class."
class TravelAgent: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.TravelAgent }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .location }
    }
}
