//
//  LightningReflexes.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Nature spell. If you play it this turn, Discover another."
// The second Discover is conditional.
class LightningReflexes: ClassOrNeutralNatureSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.LightningReflexes }
}
