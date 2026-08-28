//
//  UnstableEvolution.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Echo Transform a friendly minion into one that costs (1) more."
class UnstableEvolution: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.UnstableEvolution }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
