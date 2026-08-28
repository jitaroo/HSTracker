//
//  ArcaneDynamo.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell that costs (5) or more."
class ArcaneDynamo: ClassOrNeutralCostAtLeast5SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ArcaneDynamo }
}
