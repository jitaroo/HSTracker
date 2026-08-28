//
//  AlterTime.swift
//  HSTracker
//
//  Created by Francisco Moraes on 11/4/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

// "Discover two Arcane spells from the past. They cost (2) less."
//
// Mirrors HDT's `class AlterTime : FromThePastPoolCard, ICardGenerator` - this card plays both
// roles. The FromThePastPoolCard half supplies the Outfinder pool/summary shown on hover (and
// therefore the right-click pool browser); the ICardGenerator half is a separate registration
// (see ReflectionHelper, where the ICardGenerator sweep is its own `if`, not part of the
// related-cards else-if chain) used to decide which cards this one can generate.
class AlterTime: FromThePastPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.AlterTime }

    // "Discover two" - two independent discover events, not one batch of two.
    override func eventCount() -> Int { 2 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClassOrNeutral(playerClass) && $0.spellSchool == .arcane
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        card.type == .spell &&
        card.isClass(cardClass: .mage) &&
        card.spellSchool == .arcane &&
        (CardSet.wildSets.contains(card.set ?? .invalid) || CardSet.classicSets.contains(card.set ?? .invalid))
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        card.ids.allSatisfy { isInGeneratorPool(Card(id: $0), gameMode, format) }
    }
}
