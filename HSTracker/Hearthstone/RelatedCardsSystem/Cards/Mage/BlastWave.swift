//
//  BlastWave.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $2 damage to all minions. Overkill: Add a random Mage spell to your hand."
class BlastWave: BabblingBook {
    override func getCardId() -> String { CardIds.Collectible.Mage.BlastWave }
}
