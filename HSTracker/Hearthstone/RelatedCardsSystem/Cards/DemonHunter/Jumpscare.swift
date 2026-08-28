//
//  Jumpscare.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Demon that costs (5) or more with a Dark Gift."
class Jumpscare: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.Jumpscare }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost >= 5 && $0.isDemon() && $0.isClassOrNeutral(playerClass)
        }
    }
}
