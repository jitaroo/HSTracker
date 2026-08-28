//
//  JadeGuardians.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get two random 8-Cost minions. They cost (1) less for each card you played for 2 Mana this game."
class JadeGuardians: Cost8MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.JadeGuardians }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
