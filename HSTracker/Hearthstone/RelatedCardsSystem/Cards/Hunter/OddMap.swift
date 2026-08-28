//
//  OddMap.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover an odd-Attack Beast. If you play it this turn, also pick one of the others."
class OddMap: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.OddMap }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isBeast() && $0.attack % 2 != 0 && $0.isClassOrNeutral(playerClass)
        }
    }
}
