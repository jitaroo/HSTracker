//
//  LyraTheSunshard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a spell, add a random Priest spell to your hand."
class LyraTheSunshard: PriestSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.LyraTheSunshard }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class LyraTheSunshardCorePlaceholder: LyraTheSunshard {
    override func getCardId() -> String { CardIds.Collectible.Priest.LyraTheSunshardCorePlaceholder }
}
