//
//  CarrierWhelp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random Dragon that costs (3) or less."
class CarrierWhelp: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.CarrierWhelp }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost <= 3 && $0.isDragon() }
    }
}
