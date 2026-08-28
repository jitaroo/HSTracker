//
//  DelayedProduct.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover and summon a minion that costs (8) or more. It goes Dormant for 2 turns."
class DelayedProduct: ClassOrNeutralCostAtLeast8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.DelayedProduct }
}
