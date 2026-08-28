//
//  StoryOfUmbra.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Deathrattle minion that costs (5) or more. Summon it and trigger its Deathrattle."
class StoryOfUmbra: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.StoryOfUmbra }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.cost >= 5 && $0.isClassOrNeutral(playerClass) && $0.hasDeathrattle()
        }
    }
}
