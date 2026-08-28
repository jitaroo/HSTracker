//
//  SnackRun.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. Restore Health to your hero equal to its Cost."
// Same effect and pool as IvoryKnight.
class SnackRun: IvoryKnightKARA {
    override func getCardId() -> String { CardIds.Collectible.Paladin.SnackRun }
}
