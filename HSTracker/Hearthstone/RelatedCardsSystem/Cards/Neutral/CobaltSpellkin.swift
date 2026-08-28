//
//  CobaltSpellkin.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add two 1-Cost spells from your class to your hand."
class CobaltSpellkin: PlayerClassCost1SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.CobaltSpellkin }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
