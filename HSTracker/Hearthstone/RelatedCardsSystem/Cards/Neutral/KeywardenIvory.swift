//
//  KeywardenIvory.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Dual Class spell from any class. Spellburst: Get another copy."
class KeywardenIvory: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.KeywardenIvory }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .spell && $0.multipleClasses > 0 }
    }
}
