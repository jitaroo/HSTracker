//
//  CarefreeCookie.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Demon Hunter Tourist. After a friendly minion dies, summon a random minion that costs
// (1) more." Which minion dies next is unknown, so friendly minions are candidates and the
// summary averages over them.
class CarefreeCookie: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.CarefreeCookie }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
