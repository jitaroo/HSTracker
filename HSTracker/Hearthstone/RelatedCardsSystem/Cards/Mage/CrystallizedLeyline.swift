//
//  CrystallizedLeyline.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random 6-Cost minion, {1} times." The base cost of 6 is raised by Leyline
// effect increases (Mystic Runesaber, The Arcanomicon), and the number of summons is
// 1 + the extra triggers from LeylineExtraTriggerCounter (Surge Needle, The Arcanomicon).
// Each summon is an independent draw from the same cost bucket, so the target is yielded
// once per summon.
class CrystallizedLeyline: StateValuePoolCard {
    override func getCardId() -> String { CardIds.Collectible.Mage.CrystallizedLeyline }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        let increase: LeylineEffectIncreaseCounter? = RelativeCostPoolCard.getCounter(player: player)
        return 6 + (increase?.counter ?? 0)
    }

    override func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        guard let cost = targetCost(player: player, hoveredEntity: hoveredEntity) else {
            return []
        }
        let extraTriggers: LeylineExtraTriggerCounter? = RelativeCostPoolCard.getCounter(player: player)
        let summons = 1 + (extraTriggers?.counter ?? 0)
        return Array(repeating: (cost, 0), count: summons)
    }
}
