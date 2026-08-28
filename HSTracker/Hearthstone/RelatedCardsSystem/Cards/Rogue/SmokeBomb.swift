//
//  SmokeBomb.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Combo, Battlecry, or Stealth minion with a Dark Gift."
class SmokeBomb: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.SmokeBomb }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass)
                && ($0.mechanics.contains("COMBO") || $0.mechanics.contains("BATTLECRY") || $0.mechanics.contains("STEALTH"))
        }
    }
}
