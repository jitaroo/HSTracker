//
//  PartnerAssignment.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random 2-Cost and 3-Cost Beast to your hand."
class PartnerAssignment: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.PartnerAssignment }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && ($0.cost == 2 || $0.cost == 3) && $0.isBeast()
        }
    }
}
