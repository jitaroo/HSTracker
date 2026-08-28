//
//  WitchsCauldron.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After a friendly minion dies, add a random Shaman spell to your hand."
class WitchsCauldron: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WitchsCauldron }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.isClass(cardClass: .shaman) }
    }
}
