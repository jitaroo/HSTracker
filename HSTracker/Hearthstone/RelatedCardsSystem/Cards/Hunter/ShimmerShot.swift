//
//  ShimmerShot.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal 1 damage. Summon a random minion of that Cost."
class ShimmerShot: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.ShimmerShot }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        let game = AppDelegate.instance().coreManager.game
        let isControlledByPlayer = hoveredEntity?.isControlled(by: game.player.id) ?? false
        let relevantPlayerEntity = isControlledByPlayer ? game.playerEntity : game.opponentEntity
        let playerSpellDamage = relevantPlayerEntity?[.current_spellpower] ?? 0
        let shimmerShotSpellDamage = hoveredEntity?[.current_spellpower] ?? 0
        let cost = 1 + playerSpellDamage + shimmerShotSpellDamage
        return cost > 0 ? cost : 1
    }
}
