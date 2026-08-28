//
//  TrustFall.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover two minions that cost (5) or less. They gain each other's Attack and Health."
class TrustFall: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.TrustFall }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost <= 5 && $0.isClassOrNeutral(playerClass)
        }
    }
}
