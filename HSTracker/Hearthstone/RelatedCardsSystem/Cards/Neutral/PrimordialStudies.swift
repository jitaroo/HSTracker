//
//  PrimordialStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Spell Damage minion. Your next one costs (1) less."
class PrimordialStudies: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.PrimordialStudies }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.mechanics.contains("SPELLPOWER") && $0.isClassOrNeutral(playerClass)
        }
    }
}
