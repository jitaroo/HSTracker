//
//  DarkPeddler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 1-Cost card."
class DarkPeddlerLOE: ClassOrNeutralCost1CardPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DarkPeddlerLOE }
}

class DarkPeddlerCore: DarkPeddlerLOE {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DarkPeddlerCore }
}

class DarkPeddlerWONDERS: DarkPeddlerLOE {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DarkPeddlerWONDERS }
}
