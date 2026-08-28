//
//  UmbralGeist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random Shadow spell to your hand."
// Shadow spell pool + ICardGenerator conformance inherited from ShadowSpellPool.
class UmbralGeist: ShadowSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.UmbralGeist }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
