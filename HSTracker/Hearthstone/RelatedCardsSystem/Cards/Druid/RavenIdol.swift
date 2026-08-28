//
//  RavenIdol.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose One - Discover a minion; or Discover a spell."
class RavenIdol: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.RavenIdol }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            ($0.type == .minion || $0.type == .spell) && $0.isClassOrNeutral(playerClass)
        }
    }
}

class RavenIdolCore: RavenIdol {
    override func getCardId() -> String { CardIds.Collectible.Druid.RavenIdolCore }
}
