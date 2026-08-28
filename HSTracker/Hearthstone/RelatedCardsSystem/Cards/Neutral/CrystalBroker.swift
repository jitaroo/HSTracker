//
//  CrystalBroker.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Manathirst (5): Summon a random 3-Cost minion. Manathirst (10): Summon an 8-Cost minion instead."
class CrystalBroker: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.CrystalBroker }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && ($0.cost == 3 || $0.cost == 8) }
    }
}
