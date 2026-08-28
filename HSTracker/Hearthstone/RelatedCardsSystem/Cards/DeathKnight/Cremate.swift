//
//  Cremate.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a minion with a Dark Gift. It costs (2) less."
class Cremate: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.Cremate }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isClassOrNeutral(playerClass) }
    }
}
