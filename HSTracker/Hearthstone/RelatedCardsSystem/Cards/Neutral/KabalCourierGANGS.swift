//
//  KabalCourierGANGS.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Mage, Priest, or Warlock card."
class KabalCourierGANGS: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.KabalCourierGANGS }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.isClass(cardClass: .mage) || $0.isClass(cardClass: .priest) || $0.isClass(cardClass: .warlock)
        }
    }
}

class KabalCourierWONDERS: KabalCourierGANGS {
    override func getCardId() -> String { CardIds.Collectible.Neutral.KabalCourierWONDERS }
}
