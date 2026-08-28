//
//  TwistedKnowledge.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover 2 Warlock cards."
class TwistedKnowledge: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warlock.TwistedKnowledge }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.isClass(cardClass: .warlock) }
    }
}
