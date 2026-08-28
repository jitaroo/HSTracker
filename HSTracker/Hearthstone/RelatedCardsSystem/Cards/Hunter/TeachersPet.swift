//
//  TeachersPet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Deathrattle: Summon a random 3-Cost Beast."
class TeachersPet: Cost3BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.TeachersPet }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
