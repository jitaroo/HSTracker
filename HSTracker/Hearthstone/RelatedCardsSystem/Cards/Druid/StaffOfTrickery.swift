//
//  StaffOfTrickery.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, Discover a Druid card. Reduce its Cost by your hero's Attack."
class StaffOfTrickery: DruidCardPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.StaffOfTrickery }
}
