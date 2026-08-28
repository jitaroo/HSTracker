//
//  FirelandsPortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $6 damage. Summon a random 6-Cost minion."
class FirelandsPortal: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.FirelandsPortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class FirelandsPortalCorePlaceholder: FirelandsPortal {
    override func getCardId() -> String { CardIds.Collectible.Mage.FirelandsPortalCorePlaceholder }
}
