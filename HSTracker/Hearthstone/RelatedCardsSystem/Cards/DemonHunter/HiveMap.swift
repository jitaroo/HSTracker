//
//  HiveMap.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Fel spell. If you play it this turn, also pick one of the others."
class HiveMap: ClassOrNeutralFelSpellPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.HiveMap }
}
