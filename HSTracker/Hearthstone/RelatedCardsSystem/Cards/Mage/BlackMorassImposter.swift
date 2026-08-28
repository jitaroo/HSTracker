//
//  BlackMorassImposter.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each turn this is in your hand, transform it into a random 2-Cost minion that gains Spell Damage +1."
class BlackMorassImposter: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.BlackMorassImposter }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
