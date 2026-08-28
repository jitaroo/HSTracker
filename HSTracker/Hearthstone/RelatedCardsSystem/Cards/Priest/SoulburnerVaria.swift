//
//  SoulburnerVaria.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After a friendly Undead dies, deal 2 damage to the enemy hero and get a random Shadow Priest spell."
class SoulburnerVaria: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.SoulburnerVaria }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClass(cardClass: .priest) && $0.spellSchool == .shadow
        }
    }
}
