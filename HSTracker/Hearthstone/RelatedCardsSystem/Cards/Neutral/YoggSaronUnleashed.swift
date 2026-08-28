//
//  YoggSaronUnleashed.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Titan After this uses an ability, cast two random spells."
class YoggSaronUnleashed: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.YoggSaronUnleashed }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
