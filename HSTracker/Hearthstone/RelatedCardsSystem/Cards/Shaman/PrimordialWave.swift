//
//  PrimordialWave.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform enemy minions into ones that cost (1) less and friendly minions into ones
// that cost (1) more."
class PrimordialWave: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.PrimordialWave }
    override var costOffset: Int { 1 }

    // Both directions at once: friendly minions evolve (+1), enemy minions devolve (-1).
    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        let friendly = RelativeCostPoolCard.getTargetCosts(player: player, source: .friendlyBoard).map { ($0, 1) }
        let enemy = RelativeCostPoolCard.getTargetCosts(player: player, source: .enemyBoard).map { ($0, -1) }
        return friendly + enemy
    }
}

class PrimordialWaveCorePlaceholder: PrimordialWave {
    override func getCardId() -> String { CardIds.Collectible.Shaman.PrimordialWaveCorePlaceholder }
}
