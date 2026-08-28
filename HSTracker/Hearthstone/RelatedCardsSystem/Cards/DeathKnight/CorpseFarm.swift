//
//  CorpseFarm.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spend up to 8 Corpses to summon a random minion of that Cost." "Up to" is the player's
// choice; the representative outcome spends the maximum.
class CorpseFarm: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.CorpseFarm }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard let corpses = player.corpsesLeft else { return nil }
        return min(corpses, 8)
    }
}

class CorpseFarmCore: CorpseFarm {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.CorpseFarmCore }
}
