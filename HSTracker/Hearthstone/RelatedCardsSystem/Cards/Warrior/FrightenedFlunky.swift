//
//  FrightenedFlunky.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Discover a Taunt minion."
class FrightenedFlunky: ClassOrNeutralTauntMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warrior.FrightenedFlunky }
}

class FrightenedFlunkyCorePlaceholder: FrightenedFlunky {
    override func getCardId() -> String { CardIds.Collectible.Warrior.FrightenedFlunkyCorePlaceholder }
}
