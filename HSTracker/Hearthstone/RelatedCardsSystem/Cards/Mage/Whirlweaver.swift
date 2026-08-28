//
//  Whirlweaver.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you've cast a spell last turn, Discover an Elemental."
class Whirlweaver: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.Whirlweaver }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.isElemental()
        }
    }
}
