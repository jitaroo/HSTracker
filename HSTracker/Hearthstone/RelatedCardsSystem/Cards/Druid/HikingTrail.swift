//
//  HikingTrail.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Taunt minion. After you gain Armor, reopen this."
class HikingTrail: ClassOrNeutralTauntMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.HikingTrail }
}
