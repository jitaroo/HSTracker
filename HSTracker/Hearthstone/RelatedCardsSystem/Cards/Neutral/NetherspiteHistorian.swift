//
//  NetherspiteHistorian.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you're holding a Dragon, Discover a Dragon."
class NetherspiteHistorian: ClassOrNeutralDragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.NetherspiteHistorian }
}

class NetherspiteHistorianCore: NetherspiteHistorian {
    override func getCardId() -> String { CardIds.Collectible.Neutral.NetherspiteHistorianCore }
}
