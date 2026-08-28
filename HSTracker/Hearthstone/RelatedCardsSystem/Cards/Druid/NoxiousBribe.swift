//
//  NoxiousBribe.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Choose One card. It has both effects combined. Give your opponent a plain copy."
class NoxiousBribe: ClassOrNeutralChooseOneCardPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.NoxiousBribe }
}
