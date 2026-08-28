//
//  ChargedCall.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 1-Cost minion and summon it. (Upgraded for each Overload card you played this
// game!)"
class ChargedCall: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ChargedCall }
    override var batchSize: Int { 3 }
    override var isWithReplacement: Bool { false }

    override func filterPoolForPlayer(_ pool: [Card], player: Player) -> [Card] {
        return pool.filter { $0.isClassOrNeutral(player.currentClass) }
    }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        guard player.isLocalPlayer else { return nil }
        let counter: OverloadThisGameCounter? = RelativeCostPoolCard.getCounter(player: player)
        return 1 + (counter?.counter ?? 0)
    }
}
