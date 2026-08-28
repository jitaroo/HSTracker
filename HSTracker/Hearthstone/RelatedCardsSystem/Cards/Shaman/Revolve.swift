//
//  Revolve.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform all minions into random ones with the same Cost." Every minion on either
// board transforms into its own same-cost bucket.
class Revolve: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Revolve }
    override var costOffset: Int { 0 }

    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        let costs = RelativeCostPoolCard.getTargetCosts(player: player, source: .friendlyBoard)
            + RelativeCostPoolCard.getTargetCosts(player: player, source: .enemyBoard)
        return costs.map { ($0, 0) }
    }
}
