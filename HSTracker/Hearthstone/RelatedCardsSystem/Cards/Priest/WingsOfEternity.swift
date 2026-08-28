//
//  WingsOfEternity.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Dragon from the past with a Dark Gift."
// Past pools declare their own getCardPool (never shared across the past/present
// boundary); the Dark Gift is a post-pick modifier, not a pool filter.
class WingsOfEternity: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.WingsOfEternity }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isDragon() && $0.isClassOrNeutral(playerClass)
        }
    }
}
