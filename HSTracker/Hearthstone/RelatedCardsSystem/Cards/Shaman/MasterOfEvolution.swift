//
//  MasterOfEvolution.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform a friendly minion into a random one that costs (1) more."
class MasterOfEvolution: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.MasterOfEvolution }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
