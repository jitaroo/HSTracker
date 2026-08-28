//
//  WhisperingStone.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Get 2 random Fel spells."
class WhisperingStone: FelSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.WhisperingStone }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
