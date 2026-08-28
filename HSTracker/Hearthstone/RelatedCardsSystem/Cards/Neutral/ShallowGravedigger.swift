//
//  ShallowGravedigger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random Deathrattle minion to your hand."
class ShallowGravedigger: DeathrattleMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ShallowGravedigger }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class ShallowGravediggerCorePlaceholder: ShallowGravedigger {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ShallowGravediggerCorePlaceholder }
}
