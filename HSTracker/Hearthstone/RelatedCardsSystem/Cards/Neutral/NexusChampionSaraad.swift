//
//  NexusChampionSaraad.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Inspire: Add a random spell to your hand."
class NexusChampionSaraad: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.NexusChampionSaraad }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
