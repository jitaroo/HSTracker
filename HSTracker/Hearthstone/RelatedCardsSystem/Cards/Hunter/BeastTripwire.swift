//
//  BeastTripwire.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 5-Cost Beast. Shuffle 2 spells into your deck that do it again when drawn."
class BeastTripwire: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.BeastTripwire }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.cost == 5 && $0.isBeast() }
    }
}

// "Casts When Drawn Summon a random 5-Cost Beast."
class BeastTripwireToken: BeastTripwire {
    override func getCardId() -> String { CardIds.NonCollectible.Hunter.BeastTripwire_TrippedBeastTripwireToken }
}
