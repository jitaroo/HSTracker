//
//  UndefeatedChampion.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rush. Battlecry: Fill your opponent's board with random 1-Cost minions."
class UndefeatedChampion: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.UndefeatedChampion }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { BoardFill.opponentSlots }
}
