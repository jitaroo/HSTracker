//
//  ObserverOfMysteries.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Cast 2 random Secrets. At the start of your turn, destroy them."
class ObserverOfMysteries: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ObserverOfMysteries }

    // Two Secrets cast at once; Secrets in play must be unique, so model as one batch of
    // distinct draws (no replacement) rather than two independent events.
    override func picks() -> Int { 2 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.mechanics.contains("SECRET") }
    }
}
