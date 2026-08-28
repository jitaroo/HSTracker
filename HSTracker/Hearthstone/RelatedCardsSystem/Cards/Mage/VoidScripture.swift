//
//  VoidScripture.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. If you have enough Mana to play it, cast a copy of it at a random enemy."
class VoidScripture: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.VoidScripture }
}
