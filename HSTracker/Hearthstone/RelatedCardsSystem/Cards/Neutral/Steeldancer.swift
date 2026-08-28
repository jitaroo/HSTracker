//
//  Steeldancer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random minion with Cost equal to your weapon's Attack."
class Steeldancer: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Steeldancer }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        return player.board.first { $0.isWeapon }?.attack
    }
}
