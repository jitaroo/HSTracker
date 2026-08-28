//
//  EarthenMight.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give a minion +2/+2. If it's an Elemental, add a random Elemental to your hand."
class EarthenMight: ElementalMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.EarthenMight }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
