//
//  WinterspringWhelp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 1-Cost spell from any class."
class WinterspringWhelp: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.WinterspringWhelp }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.cost == 1 }
    }
}
