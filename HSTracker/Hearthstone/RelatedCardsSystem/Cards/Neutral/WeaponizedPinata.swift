//
//  WeaponizedPinata.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random Legendary minion to your hand."
class WeaponizedPinata: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WeaponizedPiñata }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
