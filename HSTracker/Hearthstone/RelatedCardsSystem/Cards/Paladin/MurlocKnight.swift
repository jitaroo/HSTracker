//
//  MurlocKnight.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Inspire: Summon a random Murloc."
class MurlocKnight: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.MurlocKnight }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
