//
//  DeepSpaceCurator.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Spellburst: Get a random minion of the spell's Cost. Set its Cost to (0)." The
// triggering spell is a future cast; spells in hand are the proxy candidates.
class DeepSpaceCurator: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DeepSpaceCurator }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .handSpells }
    override var affectsAllTargets: Bool { false }
}
