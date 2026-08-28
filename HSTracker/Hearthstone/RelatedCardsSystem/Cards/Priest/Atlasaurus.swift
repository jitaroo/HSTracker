//
//  Atlasaurus.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon a random Taunt minion that costs (5) or more."
class Atlasaurus: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.Atlasaurus }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost >= 5 && $0.hasTaunt() }
    }
}
