//
//  PharaohCat.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Reborn minion to your hand."
class PharaohCat: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.PharaohCat }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.mechanics.contains("REBORN")
        }
    }
}
