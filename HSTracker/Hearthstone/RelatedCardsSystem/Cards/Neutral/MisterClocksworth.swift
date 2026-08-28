//
//  MisterClocksworth.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind, Rewind, Rewind Battlecry: Summon 2 random Legendary minions."
class MisterClocksworth: WeaponizedPinata {
    override func getCardId() -> String { CardIds.Collectible.Neutral.MisterClocksworth }
    override func eventCount() -> Int { 2 }
}
