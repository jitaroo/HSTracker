//
//  TinyPal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, summon a random 3-Cost minion. Give it Taunt."
class TinyPal3: Cost3MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.TinyPal_TinyPalToken3 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

// "After your hero attacks, get a random Battlecry minion. It costs (2) less."
class TinyPal4: ClassOrNeutralBattlecryMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.TinyPal_TinyPalToken4 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
