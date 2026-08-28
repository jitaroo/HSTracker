//
//  ShadowjewelerHanar.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you play a Secret, Discover a Secret from a different class."
class ShadowjewelerHanar: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ShadowjewelerHanar }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && !$0.isClassOrNeutral(playerClass) && $0.mechanics.contains("SECRET")
        }
    }
}

class ShadowjewelerHanarCorePlaceholder: ShadowjewelerHanar {
    override func getCardId() -> String { CardIds.Collectible.Rogue.ShadowjewelerHanarCorePlaceholder }
}
