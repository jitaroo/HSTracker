//
//  SubmergedSpacerock.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/27/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

// "Deathrattle: Add two Arcane Mage spells to your hand. They are Temporary."
// Temporary is a post-pick modifier; the pool is Arcane Mage spells.
//
// Mirrors HDT's `class SubmergedSpacerock : DiscoverPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class SubmergedSpacerock: DiscoverPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.SubmergedSpacerock }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClass(cardClass: .mage) && $0.spellSchool == .arcane
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell &&
        card.spellSchool == .arcane &&
        card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.any { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}
