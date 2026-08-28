//
//  EverythingMustGo.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 4-Cost minions. Costs (1) less for each card you've drawn this turn."
class EverythingMustGo: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.EverythingMustGo }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
