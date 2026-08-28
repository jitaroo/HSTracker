//
//  BlessedGoods.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Secret, weapon, or Divine Shield minion."
class BlessedGoods: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.BlessedGoods }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let secrets = all.filter { $0.type == .spell && $0.isClassOrNeutral(playerClass) && $0.mechanics.contains("SECRET") }
        let weapons = all.filter { $0.type == .weapon && $0.isClassOrNeutral(playerClass) }
        let divineShieldMinions = all.filter { $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.mechanics.contains("DIVINE_SHIELD") }
        return secrets + weapons + divineShieldMinions
    }
}
