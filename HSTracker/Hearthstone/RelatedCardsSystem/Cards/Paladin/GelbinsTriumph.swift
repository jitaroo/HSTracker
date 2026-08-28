//
//  GelbinsTriumph.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get a random Paladin Aura. It lasts an additional turn."
class GelbinsTriumph: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.GelbinsTriumph }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClass(cardClass: .paladin) && $0.mechanics.contains("PALADIN_AURA")
        }
    }
}
