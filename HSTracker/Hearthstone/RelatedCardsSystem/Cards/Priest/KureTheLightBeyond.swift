//
//  KureTheLightBeyond.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spellburst: Summon a random 3-Cost minion. (Holy spells don't remove this Spellburst.)"
class KureTheLightBeyond: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.KureTheLightBeyond }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
