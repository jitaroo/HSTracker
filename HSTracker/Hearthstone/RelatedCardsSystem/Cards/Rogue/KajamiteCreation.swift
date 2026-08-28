//
//  KajamiteCreation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell from another class that costs (3) or less."
class KajamiteCreation: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.KajamiteCreation }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost <= 3 && !$0.isClassOrNeutral(playerClass)
        }
    }
}
