//
//  MismatchedFossils.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Beast and an Undead. Swap their stats."
class MismatchedFossils: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.MismatchedFossils }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && ($0.isBeast() || $0.isUndead())
        }
    }
}
