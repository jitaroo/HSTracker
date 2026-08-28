//
//  TwilightMender.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random Holy and Shadow spell."
// Two events from different sub-pools (one Holy, one Shadow) approximated as two draws
// from the union pool, like FiddlefireImp.
//
// Mirrors HDT's `class TwilightMender : DiscoverPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class TwilightMender: DiscoverPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Priest.TwilightMender }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && ($0.spellSchool == .holy || $0.spellSchool == .shadow)
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell
        && (card.spellSchool == .holy || card.spellSchool == .shadow)
        && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.any { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}
