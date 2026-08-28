//
//  EnchantedCauldron.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spellburst: Cast a random spell of the same Cost." The triggering spell is a future
// cast; spells in hand are the proxy candidates.
class EnchantedCauldron: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.EnchantedCauldron }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }
}
