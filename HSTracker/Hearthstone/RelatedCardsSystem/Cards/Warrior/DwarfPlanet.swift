//
//  DwarfPlanet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your board with random 2-Cost minions that attack random enemies."
class DwarfPlanet: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.DwarfPlanet }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { BoardFill.playerSlots }
}
