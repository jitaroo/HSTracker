//
//  MountedRaptor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random 1-Cost minion."
class MountedRaptor: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.MountedRaptor }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class MountedRaptorCore: MountedRaptor {
    override func getCardId() -> String { CardIds.Collectible.Druid.MountedRaptorCorePlaceholder }
}
