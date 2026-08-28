//
//  KingPhaoris.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: For each spell in your hand, summon a random minion of the same Cost." Each
// spell currently in hand contributes one draw from its own cost bucket.
class KingPhaoris: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.KingPhaoris }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
}
