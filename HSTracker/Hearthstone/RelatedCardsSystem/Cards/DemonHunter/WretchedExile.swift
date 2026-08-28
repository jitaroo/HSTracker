//
//  WretchedExile.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you play an Outcast card, add a random Outcast card to your hand."
class WretchedExile: OutcastCardPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.WretchedExile }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
