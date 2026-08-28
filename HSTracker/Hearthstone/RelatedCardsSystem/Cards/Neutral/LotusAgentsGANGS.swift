//
//  LotusAgentsGANGS.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Druid, Rogue, or Shaman card."
class LotusAgentsGANGS: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.LotusAgentsGANGS }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.isClass(cardClass: .druid) || $0.isClass(cardClass: .rogue) || $0.isClass(cardClass: .shaman)
        }
    }
}

class LotusAgentsWONDERS: LotusAgentsGANGS {
    override func getCardId() -> String { CardIds.Collectible.Neutral.LotusAgentsWONDERS }
}
