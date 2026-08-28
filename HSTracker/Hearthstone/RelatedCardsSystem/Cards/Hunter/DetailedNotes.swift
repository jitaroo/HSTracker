//
//  DetailedNotes.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Beast that costs (5) or more. Reduce its Cost by (2)."
class DetailedNotes: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.DetailedNotes }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost >= 5 && $0.isBeast() && $0.isClassOrNeutral(playerClass)
        }
    }
}
