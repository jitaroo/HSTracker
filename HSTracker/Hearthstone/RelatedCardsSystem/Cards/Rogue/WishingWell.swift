//
//  WishingWell.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you play a Coin, get a random Legendary minion from another class and set its Cost to (1)."
class WishingWell: OffClassLegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.WishingWell }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
