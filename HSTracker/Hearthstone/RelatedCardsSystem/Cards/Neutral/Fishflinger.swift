//
//  Fishflinger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Murloc to each player's hand."
class Fishflinger: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Fishflinger }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
