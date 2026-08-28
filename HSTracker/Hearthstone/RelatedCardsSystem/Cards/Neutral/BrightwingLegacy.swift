//
//  BrightwingLegacy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Legendary minion to your hand."
class BrightwingLegacy: WeaponizedPinata {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BrightwingLegacy }
}

class BrightwingCore: BrightwingLegacy {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BrightwingCore }
}
