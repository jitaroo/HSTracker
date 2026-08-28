//
//  TidePools.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell that costs (3) or less. After you cast a spell, reopen this."
class TidePools: ClassOrNeutralCostAtMost3SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.TidePools }
}
