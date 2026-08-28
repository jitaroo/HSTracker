//
//  MoongladePortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Restore 6 Health. Summon a random 6-Cost minion."
class MoongladePortal: Cost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.MoongladePortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
