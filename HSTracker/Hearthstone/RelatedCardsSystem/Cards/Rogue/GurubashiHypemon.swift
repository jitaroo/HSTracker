//
//  GurubashiHypemon.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 1/1 copy of a Battlecry minion. It costs (1)."
class GurubashiHypemon: ClassOrNeutralBattlecryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.GurubashiHypemon }
}
