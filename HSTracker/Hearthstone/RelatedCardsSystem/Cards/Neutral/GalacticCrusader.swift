//
//  GalacticCrusader.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Deathrattle: Get two random Holy spells. They cost (3) less."
class GalacticCrusader: HolySpellPool, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GalacticCrusader }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell && card.spellSchool == .holy && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.cards.any { isInGeneratorPool($0, gameMode, format) }
    }
}
