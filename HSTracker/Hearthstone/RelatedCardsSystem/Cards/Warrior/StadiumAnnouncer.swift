//
//  StadiumAnnouncer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Battlecry: Both players equip a random weapon. Give yours +1/+1."
class StadiumAnnouncer: WeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.StadiumAnnouncer }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
