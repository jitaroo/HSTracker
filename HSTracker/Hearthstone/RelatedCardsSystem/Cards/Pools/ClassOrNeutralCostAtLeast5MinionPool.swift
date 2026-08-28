//
//  ClassOrNeutralCostAtLeast5MinionPool.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class ClassOrNeutralCostAtLeast5MinionPool: DiscoverPoolCard {
    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost >= 5 && $0.isClassOrNeutral(playerClass) }
    }
}
