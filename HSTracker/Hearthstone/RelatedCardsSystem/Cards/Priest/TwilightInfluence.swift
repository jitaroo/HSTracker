//
//  TwilightInfluence.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose One - Destroy a minion with 3 or less Attack; or Summon a random 2-Cost minion."
class TwilightInfluence: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.TwilightInfluence }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
