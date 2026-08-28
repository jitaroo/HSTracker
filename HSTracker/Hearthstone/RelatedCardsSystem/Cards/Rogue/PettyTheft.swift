//
//  PettyTheft.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get two random 1-Cost spells from other classes."
class PettyTheft: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.PettyTheft }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost == 1 && !$0.isClassOrNeutral(playerClass)
        }
    }
}
