//
//  HighborneMentor.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a 2/2 Pupil. Discover a spell that costs (7) or more from the past to teach it."
class HighborneMentor: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Druid.HighborneMentor }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.cost >= 7 && $0.isClassOrNeutral(playerClass)
        }
    }
}
