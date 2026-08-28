//
//  StewardOfScrolls.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spell Damage +1 Battlecry: Discover a spell."
class StewardOfScrolls: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.StewardOfScrolls }
}
