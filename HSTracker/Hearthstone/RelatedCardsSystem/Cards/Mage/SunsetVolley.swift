//
//  SunsetVolley.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $10 damage randomly split among all enemies. Summon a random 10-Cost minion."
class SunsetVolley: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.SunsetVolley }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 10 }
    }
}
