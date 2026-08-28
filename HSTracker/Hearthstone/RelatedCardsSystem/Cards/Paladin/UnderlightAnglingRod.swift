//
//  UnderlightAnglingRod.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your Hero attacks, add a random Murloc to your hand."
class UnderlightAnglingRod: MurlocKnight {
    override func getCardId() -> String { CardIds.Collectible.Paladin.UnderlightAnglingRod }
}

class UnderlightAnglingRodCorePlaceholder: UnderlightAnglingRod {
    override func getCardId() -> String { CardIds.Collectible.Paladin.UnderlightAnglingRodCorePlaceholder }
}
