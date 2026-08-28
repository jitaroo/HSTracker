//
//  Kalecgos.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Your first spell each turn costs (0). Battlecry: Discover a spell."
class Kalecgos: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.Kalecgos }
}

class KalecgosCorePlaceholder: Kalecgos {
    override func getCardId() -> String { CardIds.Collectible.Mage.KalecgosCorePlaceholder }
}
