//
//  DesperateMeasures.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Twinspell Cast a random Paladin Secret."
// The Secret enters play, so ICardGenerator lets SecretsManager narrow the opponent's
// possible Secrets.
class DesperateMeasures: DiscoverPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Paladin.DesperateMeasures }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClass(cardClass: .paladin) && $0.mechanics.contains("SECRET")
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.mechanics.contains("SECRET") && card.isClass(cardClass: .paladin) && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.cards.any { isInGeneratorPool($0, gameMode, format) }
    }
}

// Twinspell copy - reproduces the same "Cast a random Paladin Secret" effect
class DesperateMeasuresToken: DesperateMeasures {
    override func getCardId() -> String { CardIds.NonCollectible.Paladin.DesperateMeasures_DesperateMeasuresToken }
}
