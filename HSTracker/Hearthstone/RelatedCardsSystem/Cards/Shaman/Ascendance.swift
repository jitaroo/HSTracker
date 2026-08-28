//
//  Ascendance.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform all friendly minions into ones that cost (1) more. They summon the originals
// when they die."
class Ascendance: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Ascendance }
    override var costOffset: Int { 1 }
}
