//
//  Morchie.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Your Rewinds keep BOTH potential outcomes. Battlecry: Discover a Rewind card from any class."
class Morchie: RewindCardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Morchie }
}
