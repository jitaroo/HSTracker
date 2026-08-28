//
//  RewindCardPool.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Shared pool. Cards inherit this for the card pool only; each card declares its own
// picks()/eventCount()/isWithReplacement().
class RewindCardPool: DiscoverPoolCard {
    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        // "from any class" - class cards only, the in-game pool has no Neutral Rewinds.
        return Cards.collectible().filter { $0.mechanics.contains("REWIND") && $0.playerClass != .neutral }
    }
}
