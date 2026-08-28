//
//  BloomingBulb.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Cast three random {0}-Cost spells. (Upgrades each turn!)" - Cultivating Sprite's token.
// The current spell cost is on the entity's tag_script_data_num_1; 0 or no entity means the
// base cost of 1. Three independent casts -> batch of 3 with replacement.
class BloomingBulb: StateValuePoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.CultivatingSprite_BloomingBulbToken }
    override var batchSize: Int { 3 }
    override func isInPool(_ card: Card) -> Bool { card.type == .spell }
    override var poolCacheKey: String { "spells" }

    override func targetCost(player: Player, hoveredEntity: Entity?) -> Int? {
        let cost = hoveredEntity?[.tag_script_data_num_1] ?? 0
        return cost > 0 ? cost : 1
    }
}
