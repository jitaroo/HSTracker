//
//  HarbingerOfTheBlighted.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever this enters your hand from the battlefield, summon two random 2-Cost minions."
// 2-Cost minion pool (two draws) inherited from DistressSignal.
class HarbingerOfTheBlighted: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.HarbingerOfTheBlighted }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
