//
//  AzsharanScroll.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Fire, Frost or Nature spell. Put a 'Sunken Scroll' on the bottom of your deck."
class AzsharanScroll: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.AzsharanScroll }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClassOrNeutral(playerClass)
                && ($0.spellSchool == .fire || $0.spellSchool == .frost || $0.spellSchool == .nature)
        }
    }
}

// "Add a Fire, Frost, and Nature spell from your class to your hand." (Sunken Scroll, shuffled in by Azsharan Scroll)
class SunkenScrollToken: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.AzsharanScroll_SunkenScrollToken }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible()
        let fire = all.filter { $0.type == .spell && $0.isClass(cardClass: playerClass) && $0.spellSchool == .fire }
        let frost = all.filter { $0.type == .spell && $0.isClass(cardClass: playerClass) && $0.spellSchool == .frost }
        let nature = all.filter { $0.type == .spell && $0.isClass(cardClass: playerClass) && $0.spellSchool == .nature }
        return fire + frost + nature
    }
}
