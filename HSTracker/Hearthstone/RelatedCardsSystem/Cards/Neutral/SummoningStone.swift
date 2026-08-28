//
//  SummoningStone.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a spell, summon a random minion of the same Cost." The triggering
// spell is a future cast; spells in hand are the proxy candidates.
class SummoningStone: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SummoningStone }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
}
