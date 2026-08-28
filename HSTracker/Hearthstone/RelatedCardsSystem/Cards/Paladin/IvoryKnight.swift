//
//  IvoryKnight.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. Restore Health to your hero equal to its Cost."
class IvoryKnightKARA: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.IvoryKnightKARA }
}

class IvoryKnightCore: IvoryKnightKARA {
    override func getCardId() -> String { CardIds.Collectible.Paladin.IvoryKnightCore }
}

class IvoryKnightWONDERS: IvoryKnightKARA {
    override func getCardId() -> String { CardIds.Collectible.Paladin.IvoryKnightWONDERS }
}
