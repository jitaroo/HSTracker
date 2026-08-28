//
//  JungleJammer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random 1-Cost Beast. (Cast spells while equipped to improve!)"
class JungleJammer: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.JungleJammer }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 1 && $0.isBeast() }
    }
}
