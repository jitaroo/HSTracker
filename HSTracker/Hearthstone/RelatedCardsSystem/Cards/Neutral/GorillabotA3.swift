//
//  GorillabotA3.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you control another Mech, Discover a Mech."
class GorillabotA3: ClassOrNeutralMechMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GorillabotA3 }
}

class GorillabotA3Core: GorillabotA3 {
    override func getCardId() -> String { CardIds.Collectible.Neutral.GorillabotA3Core }
}
