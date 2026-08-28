//
//  GrimestreetInformantGANGS.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Hunter, Paladin, or Warrior card."
class GrimestreetInformantGANGS: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GrimestreetInformantGANGS }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.isClass(cardClass: .hunter) || $0.isClass(cardClass: .paladin) || $0.isClass(cardClass: .warrior)
        }
    }
}

class GrimestreetInformantWONDERS: GrimestreetInformantGANGS {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GrimestreetInformantWONDERS }
}
