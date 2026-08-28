//
//  BoggspineKnuckles.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, transform your minions into random ones that cost (1) more."
class BoggspineKnuckles: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BoggspineKnuckles }
    override var costOffset: Int { 1 }
}
