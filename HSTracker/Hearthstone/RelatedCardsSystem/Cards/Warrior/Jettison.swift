//
//  Jettison.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. Spend 2 Armor to Discover another."
// The second Discover is conditional, so eventCount stays 1 (only unconditional
// invocations count).
class Jettison: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.Jettison }
}
