//
//  ExarchHataaru.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell and reduce its Cost by (1). If you play it this turn, repeat this effect."
class ExarchHataaru: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.ExarchHataaru }
}
