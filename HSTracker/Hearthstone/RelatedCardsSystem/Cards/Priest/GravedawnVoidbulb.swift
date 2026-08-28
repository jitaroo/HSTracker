//
//  GravedawnVoidbulb.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 4-Cost minion and give it Taunt. Kindred: Do it again."
class GravedawnVoidbulb: Cost4MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.GravedawnVoidbulb }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
