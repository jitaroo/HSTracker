//
//  Ankylodon.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon two random 3-Cost Beasts. They attack random enemies."
class Ankylodon: Cost3BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Ankylodon }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
