//
//  Evolve.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform your minions into random minions that cost (1) more."
class Evolve: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Evolve }
    override var costOffset: Int { 1 }
}
