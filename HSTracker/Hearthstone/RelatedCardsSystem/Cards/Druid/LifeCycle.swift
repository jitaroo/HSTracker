//
//  LifeCycle.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Destroy a minion. Summon a random minion of the same Cost to replace it."
class LifeCycle: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.LifeCycle }
    override var costOffset: Int { 0 }
    override var affectsAllTargets: Bool { false }

    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        let costs = RelativeCostPoolCard.getTargetCosts(player: player, source: .friendlyBoard)
            + RelativeCostPoolCard.getTargetCosts(player: player, source: .enemyBoard)
        return costs.map { ($0, 0) }
    }
}
