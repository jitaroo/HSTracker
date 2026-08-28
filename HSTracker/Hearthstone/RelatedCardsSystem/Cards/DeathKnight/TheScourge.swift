//
//  TheScourge.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your board with random Undead."
class TheScourge: UndeadMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.TheScourge }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { BoardFill.playerSlots }
    override func isWithReplacement() -> Bool { true }
}

class TheScourgeCorePlaceholder: TheScourge {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.TheScourgeCorePlaceholder }
}
