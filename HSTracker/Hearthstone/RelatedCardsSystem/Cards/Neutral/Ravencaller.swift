//
//  Ravencaller.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add two random 1-Cost minions to your hand."
class Ravencaller: GravelsnoutKnight {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Ravencaller }
    override func eventCount() -> Int { 2 }
}
