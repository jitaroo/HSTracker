//
//  RunedOrb.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $2 damage. Discover a spell."
class RunedOrb: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.RunedOrb }
}

class RunedOrbCore: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.RunedOrbCore }
}
