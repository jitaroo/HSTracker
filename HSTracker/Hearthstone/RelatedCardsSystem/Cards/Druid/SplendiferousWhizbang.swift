//
//  SplendiferousWhizbang.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Druid spell, a Druid minion, or a Neutral minion you can afford to play."
class MomentOfDiscoveryToken: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Druid.SplendiferousWhizbang_MomentOfDiscoveryToken }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            ($0.isClass(cardClass: playerClass) && ($0.type == .spell || $0.type == .minion)) ||
                ($0.isClass(cardClass: .neutral) && $0.type == .minion)
        }
    }
}
