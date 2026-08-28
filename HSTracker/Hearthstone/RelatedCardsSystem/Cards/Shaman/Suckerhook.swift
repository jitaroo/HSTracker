//
//  Suckerhook.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, transform your weapon into one that costs (1) more."
class Suckerhook: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Suckerhook }
    override var costOffset: Int { 1 }
    override var targetSource: RelativeCostTargetSource { .friendlyWeapon }
    override func isInPool(_ card: Card) -> Bool { card.type == .weapon }
    override var poolCacheKey: String { "weapons" }
}
