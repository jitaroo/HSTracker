//
//  StolenSteel.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a weapon (from another class)."
class StolenSteel: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.StolenSteel }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .weapon && !$0.isClassOrNeutral(playerClass)
        }
    }
}
