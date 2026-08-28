//
//  Astrobiologist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: At the start of your next turn, Discover a spell."
class Astrobiologist: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Astrobiologist }
}
