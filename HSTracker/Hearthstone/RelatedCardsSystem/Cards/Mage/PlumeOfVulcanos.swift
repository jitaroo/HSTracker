//
//  PlumeOfVulcanos.swift
//  HSTracker
//
//  Created by Francisco Moraes on 3/11/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

// "Whenever this takes damage, get a random Fire spell. It costs (3) less."
// Non-collectible token created by Vulcanos. Fire spell pool + ICardGenerator
// conformance inherited from FireSpellPool.
class PlumeOfVulcanos: FireSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.Mage.Vulcanos_PlumeOfVulcanosToken1 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class PlumeOfVulcanos2: PlumeOfVulcanos {
    override func getCardId() -> String { CardIds.NonCollectible.Mage.Vulcanos_PlumeOfVulcanosToken2 }
}
