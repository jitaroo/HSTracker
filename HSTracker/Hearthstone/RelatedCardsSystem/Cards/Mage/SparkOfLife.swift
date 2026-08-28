//
//  SparkOfLife.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose One - Discover a Mage spell; or Discover a Druid spell."
class SparkOfLife: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.SparkOfLife }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && ($0.isClass(cardClass: .mage) || $0.isClass(cardClass: .druid))
        }
    }
}
