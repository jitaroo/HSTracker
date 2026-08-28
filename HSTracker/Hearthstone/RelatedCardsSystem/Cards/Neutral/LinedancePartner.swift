//
//  LinedancePartner.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you're holding another 3-Cost card, summon a random 3-Cost minion."
class LinedancePartner: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.LinedancePartner }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
