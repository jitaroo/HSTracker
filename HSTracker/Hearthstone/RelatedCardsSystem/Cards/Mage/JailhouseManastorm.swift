//
//  JailhouseManastorm.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: After you cast a spell this game, summon a random minion of the same Cost."
// The triggering spell is a future cast; spells in hand are the proxy candidates.
class JailhouseManastorm: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.JailhouseManastorm }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
}
