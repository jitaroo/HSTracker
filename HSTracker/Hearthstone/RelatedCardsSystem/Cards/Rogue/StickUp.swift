//
//  StickUp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Quickdraw card from another class."
class StickUp: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.StickUp }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            !$0.isClassOrNeutral(playerClass) && $0.mechanics.contains("QUICKDRAW")
        }
    }
}
