//
//  InisToolkit.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Discover a weapon."
class InisToolkit: ClassOrNeutralWeaponPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.InisToolkit }
}
