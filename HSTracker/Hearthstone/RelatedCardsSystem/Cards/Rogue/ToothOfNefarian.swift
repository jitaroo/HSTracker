//
//  ToothOfNefarian.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal 3 damage. Honorable Kill: Discover a spell from another class."
class ToothOfNefarian: OffClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ToothOfNefarian }
}
