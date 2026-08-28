//
//  VoidSoul.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 1-Cost Demon. Improve your future Void Souls."
class VoidSoul: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.VoidSoul }
    override func isInPool(_ card: Card) -> Bool { card.type == .minion && card.isDemon() }
    override var poolCacheKey: String { "demons" }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        let counter: VoidSoulCounter? = RelativeCostPoolCard.getCounter(player: player)
        return counter?.counter ?? 1
    }
}
