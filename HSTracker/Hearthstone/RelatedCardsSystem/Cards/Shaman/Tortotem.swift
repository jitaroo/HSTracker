//
//  Tortotem.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, get a random minion with multiple minion types."
class Tortotem: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Tortotem }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        // Multiple minion types: a secondary race, or race "All" (Amalgams).
        return Cards.collectible().filter {
            $0.type == .minion && ($0.races.count > 1 || $0.races.contains(.all))
        }
    }
}
