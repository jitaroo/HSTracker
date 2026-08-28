//
//  GalakrondTheWretched.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon 1 random Demon."
class GalakrondTheWretched: DemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.GalakrondTheWretched }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
