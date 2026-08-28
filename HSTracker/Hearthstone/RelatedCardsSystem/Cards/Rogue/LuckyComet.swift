//
//  LuckyComet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Combo minion. The next one you play triggers its Combo twice."
class LuckyComet: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.LuckyComet }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.mechanics.contains("COMBO") && $0.isClassOrNeutral(playerClass)
        }
    }
}
