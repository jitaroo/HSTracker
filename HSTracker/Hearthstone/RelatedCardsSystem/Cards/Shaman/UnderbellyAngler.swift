//
//  UnderbellyAngler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you play a Murloc, add a random Murloc to your hand."
class UnderbellyAngler: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.UnderbellyAngler }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
