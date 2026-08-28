//
//  AnimalCompanionUpgradeCard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Ported from HDT's AnimalCompanionUpgradeCard.cs.
// "Replace your future Animal Companions with random Beasts that cost (N) more." The cost
// bucket comes from AnimalCompanionCounter: hovering your own copy shows the pool you'd get
// after playing it (counter + costOffset), while the opponent's counter already includes
// their played upgrades, so their bucket is the counter as-is.
class AnimalCompanionUpgradeCard: StateValuePoolCard {
    override func isInPool(_ card: Card) -> Bool { card.type == .minion && card.isBeast() }
    override var poolCacheKey: String { "beasts" }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard let counter: AnimalCompanionCounter = RelativeCostPoolCard.getCounter(player: player) else {
            return nil
        }
        return player.isLocalPlayer ? counter.counter + costOffset : counter.counter
    }
}
