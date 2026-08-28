//
//  Spellcoiler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you've cast a spell while holding this, Discover a spell."
class Spellcoiler: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.Spellcoiler }
}
