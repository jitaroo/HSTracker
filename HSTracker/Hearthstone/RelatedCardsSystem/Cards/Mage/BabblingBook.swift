//
//  BabblingBook.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Mage spell to your hand."
class BabblingBook: MageSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.BabblingBook }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class BabblingBookCorePlaceholder: BabblingBook {
    override func getCardId() -> String { CardIds.Collectible.Mage.BabblingBookCorePlaceholder }
}
