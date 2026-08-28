//
//  BogstrokClacker.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform adjacent minions into random minions that cost (1) more." Which
// minions end up adjacent depends on placement, so all friendly minions are treated as
// candidates and the summary averages over them.
class BogstrokClacker: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BogstrokClacker }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
