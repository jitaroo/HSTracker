//
//  MarkedShot.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $4 damage to a minion. Discover a spell."
class MarkedShot: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.MarkedShot }
}

class MarkedShotCorePlaceholder: MarkedShot {
    override func getCardId() -> String { CardIds.Collectible.Hunter.MarkedShotCorePlaceholder }
}
