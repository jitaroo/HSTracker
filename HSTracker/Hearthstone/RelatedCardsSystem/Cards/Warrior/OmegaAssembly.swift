//
//  OmegaAssembly.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Mech. If you have 10 Mana Crystals, keep all 3 instead."
class OmegaAssembly: ClassOrNeutralMechMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.OmegaAssembly }
}
