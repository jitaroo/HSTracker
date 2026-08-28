//
//  ChopshopCopter.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After a friendly Mech dies, add a random Mech to your hand."
class ChopshopCopter: MechMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.ChopshopCopter }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
