//
//  TimeMachine.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Deathrattle: Get a random Rewind card."
class TimeMachine: RewindCardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.TimeMachine }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
