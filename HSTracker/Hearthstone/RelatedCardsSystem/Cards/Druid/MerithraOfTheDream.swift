//
//  MerithraOfTheDream.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Fill your hand with random Dragons. If you spent 25 Mana while holding this, they cost (1)."
class MerithraOfTheDream: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.MerithraOfTheDream }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
