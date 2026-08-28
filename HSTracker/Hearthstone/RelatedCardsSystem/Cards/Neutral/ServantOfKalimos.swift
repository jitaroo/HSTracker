//
//  ServantOfKalimos.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you played an Elemental last turn, Discover an Elemental."
class ServantOfKalimos: ClassOrNeutralElementalMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ServantOfKalimos }
}
