//
//  Effigy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: When a friendly minion dies, summon a random minion with the same Cost." One
// unknown dying friendly minion -> averaged mixture over the board's cost buckets.
class Effigy: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.Effigy }
    override var costOffset: Int { 0 }
    override var affectsAllTargets: Bool { false }
}
