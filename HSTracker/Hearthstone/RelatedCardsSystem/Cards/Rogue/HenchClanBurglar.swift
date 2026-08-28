//
//  HenchClanBurglar.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell from another class."
class HenchClanBurglar: OffClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.HenchClanBurglar }
}

class HenchClanBurglarCorePlaceholder: HenchClanBurglar {
    override func getCardId() -> String { CardIds.Collectible.Rogue.HenchClanBurglarCorePlaceholder }
}
