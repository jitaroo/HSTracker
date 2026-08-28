//
//  BigBadVoodoo.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Give a friendly minion 'Deathrattle: Summon a random minion that costs (1) more.'"
class BigBadVoodoo: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BigBadVoodoo }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
