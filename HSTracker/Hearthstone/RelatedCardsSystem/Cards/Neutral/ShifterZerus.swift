//
//  ShifterZerus.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each turn this is in your hand, transform it into a random minion."
class ShifterZerus: MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ShifterZerus }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
