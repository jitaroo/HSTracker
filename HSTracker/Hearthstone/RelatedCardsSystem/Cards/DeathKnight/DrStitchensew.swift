//
//  DrStitchensew.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 5, 3, and 1-Cost minion to stitch to this. Deathrattle: Summon the 5-Cost minion."
class DrStitchensew: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.DrStitchensew }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && ($0.cost == 1 || $0.cost == 3 || $0.cost == 5) && $0.isClassOrNeutral(playerClass)
        }
    }
}
