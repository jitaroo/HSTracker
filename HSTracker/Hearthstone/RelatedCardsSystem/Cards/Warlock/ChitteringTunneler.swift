//
//  ChitteringTunneler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. Deal damage to your hero equal to its Cost."
class ChitteringTunneler: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.ChitteringTunneler }
}
