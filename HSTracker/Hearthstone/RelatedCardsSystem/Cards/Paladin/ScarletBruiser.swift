//
//  ScarletBruiser.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: If your deck has no Neutral cards, get a random Paladin card. It costs (2) less."
class ScarletBruiser: PaladinCardPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.ScarletBruiser }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
