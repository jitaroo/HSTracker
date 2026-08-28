//
//  RaptorNestNurse.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random 1-Cost minion. Deathrattle: Get a random 1-Cost spell."
class RaptorNestNurse: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.RaptorNestNurse }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let minions = all.filter { $0.type == .minion && $0.cost == 1 }
        let spells = all.filter { $0.type == .spell && $0.cost == 1 }
        return minions + spells
    }
}
