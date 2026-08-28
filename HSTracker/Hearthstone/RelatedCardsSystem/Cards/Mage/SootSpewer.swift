//
//  SootSpewer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spell Damage +1 Battlecry: If you control another Mech, get a random Fire spell."
class SootSpewerGVG: FireSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.SootSpewerGVG }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class SootSpewerWONDERS: SootSpewerGVG {
    override func getCardId() -> String { CardIds.Collectible.Mage.SootSpewerWONDERS }
}
