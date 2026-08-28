//
//  LilianVoss.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Replace spells in your hand with random spells (from your opponent's class)."
// Another-class spell pool inherited from HenchClanBurglar. Known approximations: the real
// pool is the opponent's class specifically, and the replaced count is unpredictable, so
// this is modeled as a single representative draw.
class LilianVoss: OffClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.LilianVoss }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class LilianVossCorePlaceholder: LilianVoss {
    override func getCardId() -> String { CardIds.Collectible.Rogue.LilianVossCorePlaceholder }
}
