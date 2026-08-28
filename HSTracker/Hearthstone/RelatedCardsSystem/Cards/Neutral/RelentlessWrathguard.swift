//
//  RelentlessWrathguard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Deal 2 damage to an enemy minion. If it dies, Discover a Demon."
class RelentlessWrathguard: ClassOrNeutralDemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.RelentlessWrathguard }
}
