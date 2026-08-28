//
//  Wormhole.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind. Summon a random 3-Cost Beast. It attacks a random enemy."
class Wormhole: Cost3BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Wormhole }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
