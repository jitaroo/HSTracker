//
//  Jackpot.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add two random spells from other classes that cost (5) or more to your hand."
class Jackpot: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Jackpot }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost >= 5 && !$0.isClassOrNeutral(playerClass)
        }
    }
}

class JackpotCore: Jackpot {
    override func getCardId() -> String { CardIds.Collectible.Rogue.JackpotCore }
}
