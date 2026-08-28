//
//  Ysondre.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon a random Dragon for each time Ysondre has died this game."
class Ysondre: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.Ysondre }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
