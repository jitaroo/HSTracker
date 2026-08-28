//
//  Circadiamancer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a random 8-Cost minion to your hand. At the start of your turns, reduce its Cost by (1)."
class Circadiamancer: ContainmentUnit {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Circadiamancer }
}
