//
//  RaidNegotiator.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Choose One card. It has both effects combined."
class RaidNegotiator: ClassOrNeutralChooseOneCardPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.RaidNegotiator }
}
