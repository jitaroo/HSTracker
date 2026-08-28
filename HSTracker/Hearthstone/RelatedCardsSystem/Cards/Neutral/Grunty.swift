//
//  Grunty.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon four random Murlocs, then shoot them at enemy minions. (You pick the targets!)"
class Grunty: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Grunty }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 4 }
}
