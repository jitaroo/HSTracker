//
//  Howdyfin.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever your hand has less than 3 cards in it, get a random Murloc."
class Howdyfin: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Howdyfin }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
