//
//  ExplosiveEvolution.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform a minion into a random one that costs (3) more."
class ExplosiveEvolution: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ExplosiveEvolution }
    override var costOffset: Int { 3 }
    override var affectsAllTargets: Bool { false }
}
