//
//  SpearheartSentry.swift
//  HSTracker
//
//  Created by Francisco Moraes on 3/11/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

// "At the end of your turn, get a random Holy spell. Reduce its Cost by (3)."
//
// Mirrors HDT's `class SpearheartSentry : HolySpellPool, ICardGenerator` - the pool half
// supplies the Outfinder hover summary (the Holy-spell pool comes from the base class), the
// generator half is a separate registration.
class SpearheartSentry: HolySpellPool, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SpearheartSentry }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell &&
               card.spellSchool == SpellSchool.holy &&
        card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.contains { c in
            isInGeneratorPool(Card(id: c), gameMode, format)
        }
    }
}
