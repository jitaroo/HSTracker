//
//  DesperateBribe.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two 2-cost minions for each player. Transform your minions into ones that cost
// (1) more."
class DesperateBribe: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.DesperateBribe }
    override var costOffset: Int { 1 }

    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        let costs = RelativeCostPoolCard.getTargetCosts(player: player, source: .friendlyBoard) + [2, 2]
        return costs.map { ($0, costOffset) }
    }
}
