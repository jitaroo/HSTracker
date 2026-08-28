//
//  OrbitalSatellite.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Draenei. If you played an adjacent card this turn, Discover another."
class OrbitalSatellite: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Paladin.OrbitalSatellite }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isClassOrNeutral(playerClass) && $0.isDraenei()
        }
    }
}
