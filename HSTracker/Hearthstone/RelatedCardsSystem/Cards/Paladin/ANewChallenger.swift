//
//  ANewChallenger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 6-Cost minion. Summon it with Taunt and Divine Shield."
class ANewChallenger: ClassOrNeutralCost6MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.ANewChallenger }
}
