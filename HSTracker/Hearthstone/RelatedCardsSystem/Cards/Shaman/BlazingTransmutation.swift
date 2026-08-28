//
//  BlazingTransmutation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose a minion. Discover one that costs (1) more to transform it into." Evolve via
// Discover: 3 unique picks from the target's cost+1 bucket.
class BlazingTransmutation: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BlazingTransmutation }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
    override var batchSize: Int { 3 }
    override var isWithReplacement: Bool { false }
}
