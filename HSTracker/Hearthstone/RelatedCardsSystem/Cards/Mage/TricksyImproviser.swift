//
//  TricksyImproviser.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Prepare Battlecry: If you've cast a spell this turn, cast two random Mage Secrets."
class TricksyImproviser: MageSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.TricksyImproviser }
    override func picks() -> Int { 2 }
    override func isWithReplacement() -> Bool { false }
}
