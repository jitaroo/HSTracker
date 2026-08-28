//
//  NecroticMortician.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If a friendly Undead died after your last turn, Discover an Unholy Rune card."
class NecroticMortician: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.NecroticMortician }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.isClass(cardClass: playerClass) && $0.costUnholy > 0 }
    }
}

class NecroticMorticianCore: NecroticMortician {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.NecroticMorticianCore }
}
