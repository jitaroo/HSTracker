//
//  YoggSaronHopesEnd.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Cast a random spell for each spell you've cast this game (targets chosen randomly)."
class YoggSaronHopesEnd: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.YoggSaronHopesEnd }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    // Casts an unpredictable number of spells; model as a single representative draw.
    override func eventCount() -> Int { 1 }
}
