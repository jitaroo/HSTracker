//
//  FirstDayOfSchool.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add 2 random 1-Cost minions to your hand."
class FirstDayOfSchool: Cost1MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.FirstDayOfSchool }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
