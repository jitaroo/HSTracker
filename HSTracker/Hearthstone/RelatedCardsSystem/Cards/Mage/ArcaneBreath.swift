//
//  ArcaneBreath.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $2 damage to a minion. If you're holding a Dragon, Discover a spell."
class ArcaneBreath: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.ArcaneBreath }
}
