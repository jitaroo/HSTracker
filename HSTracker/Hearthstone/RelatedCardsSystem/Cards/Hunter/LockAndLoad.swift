//
//  LockAndLoad.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each time you cast a spell this turn, get a random Hunter card."
class LockAndLoad: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.LockAndLoadTGT }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.isClass(cardClass: .hunter) }
    }
}

class LockAndLoadCorePlaceholder: LockAndLoad {
    override func getCardId() -> String { CardIds.Collectible.Hunter.LockAndLoadCorePlaceholder }
}

class LockAndLoadWONDERS: LockAndLoad {
    override func getCardId() -> String { CardIds.Collectible.Hunter.LockAndLoadWONDERS }
}
