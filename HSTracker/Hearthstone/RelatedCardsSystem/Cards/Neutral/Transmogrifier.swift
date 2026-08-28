//
//  Transmogrifier.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you draw a card, transform it into a random Legendary minion."
class Transmogrifier: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Transmogrifier }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
