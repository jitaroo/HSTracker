//
//  InstructorFireheart.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell that costs (1) or more. If you play it this turn, repeat this effect."
class InstructorFireheart: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.InstructorFireheart }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost >= 1 && $0.isClassOrNeutral(playerClass)
        }
    }
}
