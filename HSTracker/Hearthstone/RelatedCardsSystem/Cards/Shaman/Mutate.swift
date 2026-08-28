//
//  Mutate.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform a friendly minion into a random one that costs (1) more."
class Mutate: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Mutate }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
