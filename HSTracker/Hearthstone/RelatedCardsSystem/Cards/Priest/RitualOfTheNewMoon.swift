//
//  RitualOfTheNewMoon.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 3-Cost minions. (Cast 3 spells to summon 6-Cost minions instead.)"
// The upgraded state is a separate token below.
class RitualOfTheNewMoon: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.RitualOfTheNewMoon }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}

// "Summon two random 6-Cost minions."
class RitualOfTheFullMoonToken: Cost6MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Priest.RitualoftheNewMoon_RitualOfTheFullMoonToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
