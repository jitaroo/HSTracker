//
//  SuspiciousPeddler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 1-Cost card. If your opponent guesses your choice, they get a copy."
class SuspiciousPeddler: ClassOrNeutralCost1CardPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.SuspiciousPeddler }
}
