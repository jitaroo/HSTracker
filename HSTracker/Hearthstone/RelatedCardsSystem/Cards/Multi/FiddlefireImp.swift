//
//  FiddlefireImp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Fire Mage and Fire Warlock spell to your hand."
//
// Mirrors HDT's `class FiddlefireImp : DiscoverPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class FiddlefireImp: DiscoverPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Warlock.FiddlefireImp }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell &&
            ($0.isClass(cardClass: .mage) || $0.isClass(cardClass: .warlock)) &&
            $0.spellSchool == .fire
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell &&
        card.spellSchool == .fire &&
        (card.isClass(cardClass: .mage) || card.isClass(cardClass: .warlock)) &&
        card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.any { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}
