//
//  Marshspawn.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you cast a spell last turn, Discover a spell."
class Marshspawn: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Marshspawn }
}

class MarshspawnCorePlaceholder: Marshspawn {
    override func getCardId() -> String { CardIds.Collectible.Shaman.MarshspawnCorePlaceholder }
}
