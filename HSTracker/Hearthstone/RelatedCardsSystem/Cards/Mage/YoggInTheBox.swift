//
//  YoggInTheBox.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Cast 5 random spells (targets chosen randomly)."
class YoggInTheBox: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.YoggInTheBox }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }
}
