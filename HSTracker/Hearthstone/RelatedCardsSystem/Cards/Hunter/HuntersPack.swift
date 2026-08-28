//
//  HuntersPack.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random Hunter Beast, Secret, and weapon to your hand."
class HuntersPack: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.HuntersPack }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let beasts = all.filter { $0.type == .minion && $0.isClass(cardClass: .hunter) && $0.isBeast() }
        let secrets = all.filter { $0.type == .spell && $0.isClass(cardClass: .hunter) && $0.mechanics.contains("SECRET") }
        let weapons = all.filter { $0.type == .weapon && $0.isClass(cardClass: .hunter) }
        return beasts + secrets + weapons
    }
}
