//
//  GuardDuty.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 6, 4, and 2-Cost Taunt minion."
class GuardDuty: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.GuardDuty }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && ($0.cost == 2 || $0.cost == 4 || $0.cost == 6) && $0.hasTaunt()
        }
    }
}
