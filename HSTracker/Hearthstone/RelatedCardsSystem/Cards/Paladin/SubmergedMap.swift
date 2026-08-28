//
//  SubmergedMap.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Murloc. If you play it this turn, also pick one of the others."
class SubmergedMap: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SubmergedMap }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.isMurloc()
        }
    }
}
