//
//  JeweledMacaw.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random Beast to your hand."
class JeweledMacaw: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.JeweledMacaw }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class JeweledMacawCore: JeweledMacaw {
    override func getCardId() -> String { CardIds.Collectible.Hunter.JeweledMacawCore }
}
