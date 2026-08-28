//
//  PalmReading.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. Reduce the Cost of spells in your hand by (1)."
class PalmReading: Renew {
    override func getCardId() -> String { CardIds.Collectible.Priest.PalmReading }
}
