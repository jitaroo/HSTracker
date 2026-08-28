//
//  SuspiciousPirate.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a weapon. If your opponent guesses your choice, they get a copy."
class SuspiciousPirate: ClassOrNeutralWeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.SuspiciousPirate }
}

class SuspiciousPirateCorePlaceholder: SuspiciousPirate {
    override func getCardId() -> String { CardIds.Collectible.Warrior.SuspiciousPirateCorePlaceholder }
}
