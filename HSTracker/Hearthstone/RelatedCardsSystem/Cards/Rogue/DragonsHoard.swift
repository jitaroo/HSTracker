//
//  DragonsHoard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Legendary minion from another class."
class DragonsHoard: OffClassLegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.DragonsHoard }
}
