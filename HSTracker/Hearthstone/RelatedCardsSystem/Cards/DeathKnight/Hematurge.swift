//
//  Hematurge.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Spend a Corpse to Discover a Blood Rune card."
class Hematurge: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.Hematurge }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.isClass(cardClass: playerClass) && $0.costBlood > 0 }
    }
}

class HematurgeCore: Hematurge {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.HematurgeCore }
}
