//
//  GriftahTrustedVendor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get 3 random Legendary cards."
class AmuletOfTrackingToken2: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.GriftahTrustedVendor_AmuletOfTrackingToken2 }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.rarity == .legendary }
    }
}

// "Summon a random 4-Cost minion and give it Taunt."
class AmuletOfCrittersToken2: Cost4MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.GriftahTrustedVendor_AmuletOfCrittersToken2 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
