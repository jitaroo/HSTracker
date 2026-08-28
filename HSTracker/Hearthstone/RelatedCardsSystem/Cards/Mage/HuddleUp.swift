//
//  HuddleUp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your board with random Naga."
class HuddleUp: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.HuddleUp }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { BoardFill.playerSlots }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.isNaga() }
    }
}
