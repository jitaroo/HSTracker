//
//  FontOfPower.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Mage minion. If your deck has no minions, keep all 3 instead."
class FontOfPower: MageMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.FontOfPower }
}
