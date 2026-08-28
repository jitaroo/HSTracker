//
//  RunesOfDarkness.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a weapon. Spend 3 Corpses to give it +1/+1."
class RunesOfDarkness: ClassOrNeutralWeaponPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.RunesOfDarkness }
}
