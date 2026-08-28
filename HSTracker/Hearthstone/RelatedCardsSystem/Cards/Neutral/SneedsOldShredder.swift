//
//  SneedsOldShredder.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random Legendary minion."
class SneedsOldShredder: WeaponizedPinata {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SneedsOldShredder }
}

class SneedsOldShredderCore: SneedsOldShredder {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SneedsOldShredderCore }
}
