//
//  SilkStitching.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose a friendly minion. Discover a spell that costs (4) or less for it to cast when it dies."
class SilkStitching: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.SilkStitching }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost <= 4 && $0.isClassOrNeutral(playerClass)
        }
    }
}
