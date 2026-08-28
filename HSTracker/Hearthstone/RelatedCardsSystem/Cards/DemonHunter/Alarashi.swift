//
//  Alarashi.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform minions in your hand into random Demons. (They keep their original stats and Cost.)"
class Alarashi: DemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.Alarashi }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
