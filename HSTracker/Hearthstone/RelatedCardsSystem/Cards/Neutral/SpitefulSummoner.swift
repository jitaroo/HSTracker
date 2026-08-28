//
//  SpitefulSummoner.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Reveal a spell from your deck. Summon a random minion with the same Cost."
// One unknown revealed deck spell -> averaged mixture over the deck spells' cost buckets.
class SpitefulSummoner: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SpitefulSummoner }
    override var costOffset: Int { 0 }
    override var targetSource: RelativeCostTargetSource { .deckSpells }
    override var affectsAllTargets: Bool { false }
}
