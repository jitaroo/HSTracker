//
//  PrimalfinLookout.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you control another Murloc, Discover a Murloc."
class PrimalfinLookout: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.PrimalfinLookout }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isMurloc() && $0.isClassOrNeutral(playerClass)
        }
    }
}
