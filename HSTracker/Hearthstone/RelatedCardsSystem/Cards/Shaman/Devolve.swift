//
//  Devolve.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform all enemy minions into random ones that cost (1) less."
class Devolve: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Devolve }
    override var costOffset: Int { -1 }
    override var targetSource: RelativeCostTargetSource { .enemyBoard }
}
