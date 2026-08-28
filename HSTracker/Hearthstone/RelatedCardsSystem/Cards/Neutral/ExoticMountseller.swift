//
//  ExoticMountseller.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a spell, summon a random 3-Cost Beast."
class ExoticMountseller: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ExoticMountseller }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 3 && $0.isBeast() }
    }
}
