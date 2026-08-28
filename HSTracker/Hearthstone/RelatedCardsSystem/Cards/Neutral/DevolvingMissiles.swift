//
//  DevolvingMissiles.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Shoot three missiles at random enemy minions that transform them into ones that cost
// (1) less." Approximation: each enemy minion is treated as one draw from its cost-1
// bucket. Exact when there are three enemy minions; slightly off otherwise (missiles can
// stack on the same minion).
class DevolvingMissiles: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DevolvingMissiles }
    override var costOffset: Int { -1 }
    override var targetSource: RelativeCostTargetSource { .enemyBoard }
}
