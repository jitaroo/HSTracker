//
//  WitchsApprentice.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Add a random Shaman spell to your hand."
class WitchsApprentice: ShamanSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.WitchsApprentice }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class WitchsApprenticeCore: WitchsApprentice {
    override func getCardId() -> String { CardIds.Collectible.Shaman.WitchsApprenticeCore }
}
