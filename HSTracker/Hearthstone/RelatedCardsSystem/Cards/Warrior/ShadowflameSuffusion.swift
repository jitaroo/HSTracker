//
//  ShadowflameSuffusion.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $2 damage. Discover a Warrior minion with a Dark Gift."
class ShadowflameSuffusion: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.ShadowflameSuffusion }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isClass(cardClass: .warrior) }
    }
}
