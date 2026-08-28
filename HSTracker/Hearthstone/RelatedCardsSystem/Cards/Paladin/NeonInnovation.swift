//
//  NeonInnovation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Paladin Mech from the past. Give it +5/+5."
class NeonInnovation: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.NeonInnovation }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClass(cardClass: .paladin) && $0.isMech()
        }
    }
}
