//
//  Skyfin.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you're holding a Dragon, summon 2 random Murlocs."
class Skyfin: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Skyfin }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
