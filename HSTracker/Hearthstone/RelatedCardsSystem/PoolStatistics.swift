//
//  PoolStatistics.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

struct PoolStatistics {
    let medianCostText: String
    let medianAttackText: String?
    let medianHealthText: String?
    let costBars: [StatBar]
    let attackBars: [StatBar]?
    let healthBars: [StatBar]?
}
