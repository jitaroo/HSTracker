//
//  WaveOfNostalgia.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform ALL minions into random Legendary ones from the past."
class WaveOfNostalgia: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.WaveOfNostalgia }

    // Transforms an unpredictable number of minions (both boards); model as a single
    // representative draw, like other board-wide effects.
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.rarity == .legendary }
    }
}
