//
//  Waxmancy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Battlecry minion. Reduce its Cost by (2)."
class Waxmancy: ClassOrNeutralBattlecryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Waxmancy }
}
