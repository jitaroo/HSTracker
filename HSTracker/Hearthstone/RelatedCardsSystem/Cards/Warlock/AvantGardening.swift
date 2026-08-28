//
//  AvantGardening.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Deathrattle minion with a Dark Gift."
class AvantGardening: ClassOrNeutralDeathrattleMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.AvantGardening }
}
