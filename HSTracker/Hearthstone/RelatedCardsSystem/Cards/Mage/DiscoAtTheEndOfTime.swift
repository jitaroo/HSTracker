//
//  DiscoAtTheEndOfTime.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/27/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

// "Cast 5 random Secrets from the past. At the start of your turn, destroy them."
// Secrets in play must be distinct, so the 5 casts are modeled as one batch of 5 unique
// draws (without replacement).
//
// Mirrors HDT's `class DiscoAtTheEndOfTime : FromThePastPoolCard, ICardGenerator` - the pool
// half supplies the Outfinder hover summary, the generator half is a separate registration.
class DiscoAtTheEndOfTime: FromThePastPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.DiscoAtTheEndOfTime }
    override func picks() -> Int { 5 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.mechanics.contains("SECRET") }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.mechanics.contains("SECRET") &&
        (CardSet.wildSets.contains(card.set ?? .invalid) ||
         CardSet.classicSets.contains(card.set ?? .invalid))
    }

    // HDT uses All here (every id of a multi-id card must qualify), not Any.
    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.all { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}
