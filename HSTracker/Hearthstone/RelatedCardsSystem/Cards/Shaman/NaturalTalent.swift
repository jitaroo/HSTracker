//
//  NaturalTalent.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get a random Naga and a random spell. They cost (2) less."
class NaturalTalent: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.NaturalTalent }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let nagas = all.filter { $0.type == .minion && $0.isNaga() }
        let spells = all.filter { $0.type == .spell }
        return nagas + spells
    }
}
