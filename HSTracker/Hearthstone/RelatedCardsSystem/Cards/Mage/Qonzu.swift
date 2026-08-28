//
//  Qonzu.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. Choose to keep it or put it on top of your opponent's deck."
class Qonzu: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.Qonzu }
}
