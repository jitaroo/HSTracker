//
//  Spellslinger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Both players get a random spell. Yours costs (2) less."
class SpellslingerTGT: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.SpellslingerTGT }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}

class SpellslingerWONDERS: SpellslingerTGT {
    override func getCardId() -> String { CardIds.Collectible.Mage.SpellslingerWONDERS }
}
