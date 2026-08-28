//
//  EnergyShaper.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform all spells in your hand into ones that cost (3) more. (They keep
// their original Cost.)"
class EnergyShaper: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.EnergyShaper }
    override var costOffset: Int { 3 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }
}
