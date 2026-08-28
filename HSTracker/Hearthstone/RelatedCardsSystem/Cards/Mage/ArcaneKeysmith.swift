//
//  ArcaneKeysmith.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Secret. Put it into the battlefield."
// The Secret enters play, so ICardGenerator lets SecretsManager narrow the
// opponent's possible Secrets.
class ArcaneKeysmith: ClassOrNeutralSecretPool, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.ArcaneKeysmith }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.mechanics.contains("SECRET") && card.isClass(cardClass: .mage) && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.cards.any { isInGeneratorPool($0, gameMode, format) }
    }
}
