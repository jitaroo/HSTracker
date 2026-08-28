//
//  CabalistsTomeOG.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get 3 random Mage spells."
class CabalistsTomeOG: MageSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.CabalistsTomeOG }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }
}

class CabalistsTomeWONDERS: CabalistsTomeOG {
    override func getCardId() -> String { CardIds.Collectible.Mage.CabalistsTomeWONDERS }
}

// "Battlecry: If you're holding a Dragon, Discover an upgraded Mage spell."
class MalygosAspectOfMagic: MageSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.MalygosAspectOfMagic }
}
