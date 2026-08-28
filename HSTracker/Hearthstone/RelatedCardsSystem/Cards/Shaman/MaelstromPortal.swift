//
//  MaelstromPortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $1 damage to all enemy minions. Summon a random 1-Cost minion."
class MaelstromPortal: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.MaelstromPortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class MaelstromPortalCorePlaceholder: MaelstromPortal {
    override func getCardId() -> String { CardIds.Collectible.Shaman.MaelstromPortalCorePlaceholder }
}
