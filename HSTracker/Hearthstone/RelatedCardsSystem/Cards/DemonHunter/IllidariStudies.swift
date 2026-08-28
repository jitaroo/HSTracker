//
//  IllidariStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover an Outcast card. Your next one costs (1) less."
class IllidariStudies: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.IllidariStudies }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.isClassOrNeutral(playerClass) && $0.mechanics.contains("OUTCAST")
        }
    }
}

class IllidariStudiesCore: IllidariStudies {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.IllidariStudiesCore }
}
