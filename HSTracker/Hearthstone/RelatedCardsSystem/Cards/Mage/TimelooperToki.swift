//
//  TimelooperToki.swift
//  HSTracker
//
//  Created by Francisco Moraes on 1/28/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

// "Battlecry: Get 3 random spells from the past. When you play ALL 3, get another Timelooper
// Toki."
//
// Mirrors HDT's `class TimelooperToki : FromThePastPoolCard, ICardGenerator` - the pool half
// supplies the Outfinder hover summary, the generator half is a separate registration.
class TimelooperToki: FromThePastPoolCard, ICardGenerator {
    override func getCardId() -> String { CardIds.Collectible.Mage.TimelooperToki }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.isClassOrNeutral(playerClass) }
    }

    func isInGeneratorPool(_ card: Card, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.type == .spell &&
        (CardSet.wildSets.contains(card.set ?? .invalid) ||
         CardSet.classicSets.contains(card.set ?? .invalid))
    }

    func isInGeneratorPool(_ card: MultiIdCard, _ gameMode: GameType, _ format: FormatType) -> Bool {
        return card.ids.all { c in
            isInGeneratorPool(Card(id: c), gameMode, format)
        }
    }
}
