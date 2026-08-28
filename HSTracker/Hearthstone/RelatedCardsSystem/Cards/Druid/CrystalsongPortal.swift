//
//  CrystalsongPortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Druid minion. If your hand has no minions, keep all 3 instead."
class CrystalsongPortal: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.CrystalsongPortal }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClass(cardClass: .druid)
        }
    }
}
