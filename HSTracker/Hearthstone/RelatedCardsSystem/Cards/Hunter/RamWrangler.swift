//
//  RamWrangler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you have a Beast, summon a random Beast."
class RamWrangler: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.RamWrangler }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
