//
//  PilotedWhirlOTron.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon a random 3-Cost minion."
class PilotedWhirlOTronToken: Cost3MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Warrior.PilotedWhirlOTronToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
