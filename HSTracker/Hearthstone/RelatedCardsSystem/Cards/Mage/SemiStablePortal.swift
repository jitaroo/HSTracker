//
//  SemiStablePortal.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Add a random minion to your hand. It costs (3) less."
class SemiStablePortal: MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.SemiStablePortal }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
