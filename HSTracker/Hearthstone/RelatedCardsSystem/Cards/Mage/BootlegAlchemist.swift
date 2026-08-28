//
//  BootlegAlchemist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Choose a card in your hand. Transform it into a spell that costs (5) more
// (keeps its original Cost)."
class BootlegAlchemist: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.BootlegAlchemist }
    override var costOffset: Int { 5 }
    override var targetSource: RelativeCostTargetSource { .handCards }
    override var affectsAllTargets: Bool { false }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }
}
