//
//  RaptorHerald.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Battlecry: Discover a Beast with a Dark Gift. Kindred: It costs (1) less."
class RaptorHeraldCore: ClassOrNeutralBeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.RaptorHeraldCore }
}
