//
//  FacelessSummoner.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random 3-Cost minion."
class FacelessSummoner: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.FacelessSummoner }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
