//
//  Astromancer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random minion with Cost equal to your hand size." The battlecry
// resolves after the card leaves the hand, so with an in-hand copy the hand counts one less.
class Astromancer: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.Astromancer }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        var handSize = player.hand.count
        if hoveredEntity != nil {
            handSize -= 1
        }
        return max(handSize, 0)
    }
}

class AstromancerCore: Astromancer {
    override func getCardId() -> String { CardIds.Collectible.Mage.AstromancerCore }
}
