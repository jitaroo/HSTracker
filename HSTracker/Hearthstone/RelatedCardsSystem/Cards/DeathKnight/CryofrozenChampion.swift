//
//  CryofrozenChampion.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random Legendary minion. Reduce its Cost by (1)."
class CryofrozenChampion: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.CryofrozenChampion }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
