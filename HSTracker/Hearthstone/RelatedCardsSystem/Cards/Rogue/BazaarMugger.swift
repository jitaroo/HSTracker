//
//  BazaarMugger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rush Battlecry: Add a random minion from another class to your hand."
class BazaarMugger: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.BazaarMugger }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && !$0.isClassOrNeutral(playerClass)
        }
    }
}
