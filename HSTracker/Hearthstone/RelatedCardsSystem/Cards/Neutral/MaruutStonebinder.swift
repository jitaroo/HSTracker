//
//  MaruutStonebinder.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If your deck started with no duplicates, Discover an Elemental to summon. Add the others to your hand."
class MaruutStonebinder: ClassOrNeutralElementalMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.MaruutStonebinder }
}
