//
//  PackKodo.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Beast, Secret, or weapon."
class PackKodo: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.PackKodo }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let beasts = all.filter { $0.type == .minion && $0.isBeast() && $0.isClassOrNeutral(playerClass) }
        let secrets = all.filter { $0.type == .spell && $0.mechanics.contains("SECRET") && $0.isClassOrNeutral(playerClass) }
        let weapons = all.filter { $0.type == .weapon && $0.isClassOrNeutral(playerClass) }
        return beasts + secrets + weapons
    }
}
