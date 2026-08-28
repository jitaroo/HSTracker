//
//  SpitefulChef.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a 2-Cost Taunt minion. If you have 10 or more Mana, summon a 6-Cost instead."
class SpitefulChef: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.SpitefulChef }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && ($0.cost == 2 || $0.cost == 6) && $0.hasTaunt()
        }
    }
}
