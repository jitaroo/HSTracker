//
//  BattleVicar.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/25.
//  Copyright © 2025 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Holy spell."
//
// Mirrors HDT's `class BattleVicar : DiscoverPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class BattleVicar: DiscoverPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Paladin.BattleVicar }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClassOrNeutral(playerClass) && $0.spellSchool == .holy
        }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell
            && card.spellSchool == .holy
        && card.isCardLegal(gameType: gameMode, format: format)
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.any { c in isInGeneratorPool(Card(id: c), gameMode, format) }
    }
}

class BattleVicarCore: BattleVicar {
    override func getCardId() -> String {
        return CardIds.Collectible.Paladin.BattleVicarCorePlaceholder
    }
}
