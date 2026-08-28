//
//  RoamFree.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Replace your future Animal Companions with random Beasts that cost (2) more. Choose one
// to summon." "Choose one" of the three new companions -> discover-style pick of 3
// distinct cards.
class RoamFree: AnimalCompanionUpgradeCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.RoamFree }
    override var costOffset: Int { 2 }
    override var batchSize: Int { 3 }
    override var isWithReplacement: Bool { false }
}
