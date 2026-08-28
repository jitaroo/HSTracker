//
//  RayllaSandSculptor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Paladin Tourist After you cast a spell, summon a random 2-Cost minion and give it Divine Shield."
class RayllaSandSculptor: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.RayllaSandSculptor }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
