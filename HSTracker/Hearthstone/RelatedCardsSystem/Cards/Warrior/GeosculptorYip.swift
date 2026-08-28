//
//  GeosculptorYip.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, summon a random minion with Cost equal to your Armor (up to
// 10)."
class GeosculptorYip: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.GeosculptorYip }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return min(player.hero?[.armor] ?? 0, 10)
    }
}
