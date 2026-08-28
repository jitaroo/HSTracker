//
//  Gazlowe.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a 1-Cost spell, add a random Mech to your hand."
class Gazlowe: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Gazlowe }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isMech() }
    }
}
