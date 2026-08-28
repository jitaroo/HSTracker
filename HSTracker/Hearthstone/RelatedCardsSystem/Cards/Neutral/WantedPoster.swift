//
//  WantedPoster.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a minion that costs (5) or more. Give it Prepare."
class WantedPoster: ClassOrNeutralCostAtLeast5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WantedPoster }
}
