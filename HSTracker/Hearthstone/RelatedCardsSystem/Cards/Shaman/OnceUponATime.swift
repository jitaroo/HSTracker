//
//  OnceUponATime.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 3-Cost Beast, Dragon, Elemental, and Murloc."
class OnceUponATime: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.OnceUponATime }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 4 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        let all = Cards.collectible().filter { $0.type == .minion && $0.cost == 3 }
        let beasts = all.filter { $0.isBeast() }
        let dragons = all.filter { $0.isDragon() }
        let elementals = all.filter { $0.isElemental() }
        let murlocs = all.filter { $0.isMurloc() }
        return beasts + dragons + elementals + murlocs
    }
}
