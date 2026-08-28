//
//  DwarvenArchaeologist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a card. Reduce its Cost by (1)."
class DwarvenArchaeologist: ClassOrNeutralCardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DwarvenArchaeologist }
}
