//
//  RunicAdornment.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell that costs (3) or less. Shuffle 2 copies into your deck that Cast When Drawn."
class RunicAdornment: ClassOrNeutralCostAtMost3SpellPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.RunicAdornment }
}
