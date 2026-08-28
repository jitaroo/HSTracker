//
//  SweetenedSnowflurry.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Miniaturize Battlecry: Get 2 random Temporary Frost spells."
// Temporary is a post-pick modifier; the pool is the plain Frost spell pool from ColdSnap.
class SweetenedSnowflurry: FrostSpellPool, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SweetenedSnowflurry }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell && card.spellSchool == .frost && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.cards.any { isInGeneratorPool($0, gameMode, format) }
    }
}

class SweetenedSnowflurryMini: SweetenedSnowflurry {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.SweetenedSnowflurry_SweetenedSnowflurryToken }
}
