//
//  TinyToys.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon four random 5-Cost minions. Make them 2/2."
class TinyToys: Cost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.TinyToys }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 4 }
}
