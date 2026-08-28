//
//  ConvokeTheSpirits.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Cast 8 random Druid spells (targets chosen randomly)."
class ConvokeTheSpirits: DruidSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.ConvokeTheSpirits }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 8 }
    override func isWithReplacement() -> Bool { true }
}

class ConvokeTheSpiritsCore: ConvokeTheSpirits {
    override func getCardId() -> String { CardIds.Collectible.Druid.ConvokeTheSpiritsCorePlaceholder }
}
