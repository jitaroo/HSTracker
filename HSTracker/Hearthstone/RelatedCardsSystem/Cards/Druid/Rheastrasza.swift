//
//  Rheastrasza.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the start of your turn, Discover a Dragon. It costs (4) less."
class PurifiedDragonNestToken: ClassOrNeutralDragonMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Druid.Rheastrasza_PurifiedDragonNestToken }
}
