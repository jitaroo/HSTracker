//
//  HarmonicaSoloist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you control no other minions, Discover and cast a Secret."
class HarmonicaSoloist: ClassOrNeutralSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.HarmonicaSoloist }
}
