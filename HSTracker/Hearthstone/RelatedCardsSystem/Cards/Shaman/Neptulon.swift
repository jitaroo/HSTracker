//
//  Neptulon.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add 4 random Murlocs to your hand. Overload: (3)"
class Neptulon: UnderbellyAngler {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Neptulon }
    override func eventCount() -> Int { 4 }
}
