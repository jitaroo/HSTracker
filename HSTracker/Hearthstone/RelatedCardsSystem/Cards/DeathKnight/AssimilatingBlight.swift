//
//  AssimilatingBlight.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 3-Cost Deathrattle minion. Summon it with Reborn."
class AssimilatingBlight: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.AssimilatingBlight }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost == 3 && $0.isClassOrNeutral(playerClass) && $0.hasDeathrattle()
        }
    }
}
