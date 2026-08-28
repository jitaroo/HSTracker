//
//  AeonWizard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Battlecry: Get 2 random spells from your class."
class AeonWizard: PlayerClassSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.AeonWizard }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
