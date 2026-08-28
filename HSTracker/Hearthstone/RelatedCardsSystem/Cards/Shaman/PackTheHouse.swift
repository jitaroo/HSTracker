//
//  PackTheHouse.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 6, 5, 4, and 3-Cost minion. Overload: (2)"
class PackTheHouse: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.PackTheHouse }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 4 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && ($0.cost == 3 || $0.cost == 4 || $0.cost == 5 || $0.cost == 6)
        }
    }
}
