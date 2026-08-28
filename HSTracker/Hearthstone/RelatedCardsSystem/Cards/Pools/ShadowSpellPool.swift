//
//  ShadowSpellPool.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Shared pool. Cards inherit this for the card pool only; each card declares its own
// picks()/eventCount()/isWithReplacement().
class ShadowSpellPool: DiscoverPoolCard, ICardGenerator {
    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.spellSchool == .shadow }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell && card.spellSchool == .shadow && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.cards.any { isInGeneratorPool($0, gameMode, format) }
    }
}
