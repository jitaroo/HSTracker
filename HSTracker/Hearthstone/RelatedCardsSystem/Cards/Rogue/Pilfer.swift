//
//  Pilfer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random card from another class to your hand."
class PilferLegacy: OffClassCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.PilferLegacy }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
