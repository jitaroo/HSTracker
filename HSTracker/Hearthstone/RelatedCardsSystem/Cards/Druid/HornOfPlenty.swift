//
//  HornOfPlenty.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Nature spell. It costs (2) less."
class HornOfPlenty: ClassOrNeutralNatureSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.HornOfPlenty }
}
