//
//  ElementalRift.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the end of your turn, summon two random Elementals."
class ElementalRift: ElementalMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.ElementalRift }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
