//
//  DarkProphecy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 2-Cost minion. Summon it and give it +3 Health."
class DarkProphecy: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.DarkProphecy }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 2 && $0.isClassOrNeutral(playerClass) }
    }
}
