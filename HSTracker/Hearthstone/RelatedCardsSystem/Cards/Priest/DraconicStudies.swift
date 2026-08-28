//
//  DraconicStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Dragon. Your next one costs (1) less."
class DraconicStudies: ClassOrNeutralDragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.DraconicStudies }
}
