//
//  FreeFromAmber.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a minion that costs (8) or more. Summon it."
class FreeFromAmber: ClassOrNeutralCostAtLeast8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.FreeFromAmber }
}
