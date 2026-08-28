//
//  WhackAGnoll.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Paladin weapon from the past. Give it +1/+1."
class WhackAGnoll: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.WhackAGnoll }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .weapon && $0.isClass(cardClass: .paladin) }
    }
}
