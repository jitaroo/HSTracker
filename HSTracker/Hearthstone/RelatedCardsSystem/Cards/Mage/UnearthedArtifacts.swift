//
//  UnearthedArtifacts.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 2-Cost minion. If you've Discovered this turn, summon a random 4-Cost minion instead."
class UnearthedArtifacts: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.UnearthedArtifacts }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && ($0.cost == 2 || $0.cost == 4) }
    }
}
