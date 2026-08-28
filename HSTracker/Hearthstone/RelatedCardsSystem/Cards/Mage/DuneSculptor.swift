//
//  DuneSculptor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you cast a spell, add a random Mage minion to your hand."
class DuneSculptor: MageMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.DuneSculptor }
    override func picks() -> Int { 1 }
}
