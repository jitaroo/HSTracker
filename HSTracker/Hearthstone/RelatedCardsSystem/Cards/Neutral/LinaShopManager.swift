//
//  LinaShopManager.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you cast a spell, fill your board with random minions of that Cost." The
// triggering spell is a future cast; spells in hand are the proxy candidates. Casting one
// fills the empty board slots with minions of its cost, so each candidate draws batchSize
// (available slots) times from its cost bucket.
class LinaShopManager: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.LinaShopManager }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
    override var batchSize: Int { BoardFill.playerSlots }
}
