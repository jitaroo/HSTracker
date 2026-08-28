//
//  FelerinTheForgotten.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Outcast card to the left and right sides of your hand. They cost (2) less."
class FelerinTheForgotten: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.FelerinTheForgotten }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.mechanics.contains("OUTCAST") }
    }
}
