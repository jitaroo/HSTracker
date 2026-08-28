//
//  TamePet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Replace your future Animal Companions with random Beasts that cost (1) more. Draw a
// card."
class TamePet: AnimalCompanionUpgradeCard {
    override func getCardId() -> String { CardIds.Collectible.Hunter.TamePet }
    override var costOffset: Int { 1 }
}
