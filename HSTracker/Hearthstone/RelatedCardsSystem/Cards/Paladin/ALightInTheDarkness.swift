//
//  ALightInTheDarkness.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Paladin minion. Give it +2/+2."
class ALightInTheDarknessOG: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.ALightInTheDarknessOG }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isClass(cardClass: .paladin) }
    }
}

class ALightInTheDarknessWONDERS: ALightInTheDarknessOG {
    override func getCardId() -> String { CardIds.Collectible.Paladin.ALightInTheDarknessWONDERS }
}
