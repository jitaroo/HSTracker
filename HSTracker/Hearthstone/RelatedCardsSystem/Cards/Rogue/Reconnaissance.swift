//
//  Reconnaissance.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Deathrattle minion from another class. It costs (2) less."
class Reconnaissance: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Reconnaissance }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && !$0.isClassOrNeutral(playerClass) && $0.hasDeathrattle()
        }
    }
}
