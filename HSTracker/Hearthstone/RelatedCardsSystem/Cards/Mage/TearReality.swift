//
//  TearReality.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/27/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 2 random Mage spells from the past to your hand. They cost (2) less."
//
// Mirrors HDT's `class TearReality : FromThePastPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class TearReality: FromThePastPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.TearReality }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.isClass(cardClass: .mage) }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell &&
        card.isClass(cardClass: .mage) &&
        (CardSet.wildSets.contains(card.set ?? .invalid) ||
         CardSet.classicSets.contains(card.set ?? .invalid))
    }

    // HDT uses All here (every id of a multi-id card must qualify), not Any.
    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.all { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}
