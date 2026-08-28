//
//  ShellGame.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get a random Epic, Rare, and Common card from other classes."
// One draw per rarity from the combined other-class pool (approximation of the three sub-pools).
class ShellGame: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ShellGame }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            ($0.rarity == .common || $0.rarity == .rare || $0.rarity == .epic) && !$0.isClassOrNeutral(playerClass)
        }
    }
}
