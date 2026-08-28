//
//  TwistPlagueOfDeath.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "When 3 friendly minions die, summon a random minion."
class EternalTombToken: MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.TwistPlagueofDeath_EternalTombToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
