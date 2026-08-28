//
//  Recombobulator.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform a friendly minion into a random minion with the same Cost." One
// chosen friendly minion -> averaged mixture over its cost bucket.
class Recombobulator: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Recombobulator }
    override var costOffset: Int { 0 }
    override var affectsAllTargets: Bool { false }
}
