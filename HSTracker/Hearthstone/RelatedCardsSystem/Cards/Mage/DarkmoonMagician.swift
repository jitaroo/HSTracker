//
//  DarkmoonMagician.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Elusive. After you cast a spell, cast a random spell that costs (1) more."
class DarkmoonMagician: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.DarkmoonMagician }
    override var costOffset: Int { 1 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }
}
