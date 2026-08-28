//
//  NellieTheGreatThresher.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Colossal +1. Battlecry: Discover 3 Pirates to crew Nellie's Ship!"
class NellieTheGreatThresher: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Warrior.NellieTheGreatThresher }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 3 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.isPirate()
        }
    }
}
