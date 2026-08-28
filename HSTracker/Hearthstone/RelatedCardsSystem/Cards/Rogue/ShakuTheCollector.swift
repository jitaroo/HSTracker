//
//  ShakuTheCollector.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Stealth Whenever this attacks, add a card from another class to your hand."
class ShakuTheCollector: OffClassCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ShakuTheCollector }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class ShakuTheCollectorCore: ShakuTheCollector {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ShakuTheCollectorCore }
}
