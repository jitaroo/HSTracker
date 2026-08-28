//
//  TheFoodChain.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rush Battlecry: Discover any 8, 6, and 4-Attack Beast. Set their Costs to (2)."
class ShokkJungleTyrantToken: Attack468BeastMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Hunter.TheFoodChain_ShokkJungleTyrantToken }
    override func picks() -> Int { 3 }
}

class TheFoodChain: Attack468BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.TheFoodChain }
    override func picks() -> Int { 3 }
}
