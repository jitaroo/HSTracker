//
//  DeckOfLunacy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform spells in your deck into ones that cost (3) more. (They keep their original
// Cost.)"
class DeckOfLunacy: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.DeckOfLunacy }
    override var costOffset: Int { 3 }
    override var targetSource: RelativeCostTargetSource { .deckSpells }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }
}
