//
//  MendTheTimeline.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Get 2 random Holy spells. Restore Health to your hero equal to their Costs."
class MendTheTimeline: HolySpellPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.MendTheTimeline }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 2 }
}
