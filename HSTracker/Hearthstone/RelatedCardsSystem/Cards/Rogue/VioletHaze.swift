//
//  VioletHaze.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 2 random Deathrattle cards to your hand."
class VioletHaze: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.VioletHaze }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.hasDeathrattle() }
    }
}
