//
//  FrostStrikeCore.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $3 damage to a minion. If it dies, Discover a Frost Rune card."
class FrostStrikeCore: FrostRuneCardPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.FrostStrikeCore }
}
