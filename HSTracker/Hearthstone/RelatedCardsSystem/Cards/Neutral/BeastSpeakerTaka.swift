//
//  BeastSpeakerTaka.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Legendary Beast from any class to gain its stats. Deathrattle: Summon it."
class BeastSpeakerTaka: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.BeastSpeakerTaka }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.type == .minion && $0.rarity == .legendary && $0.isBeast() }
    }
}
