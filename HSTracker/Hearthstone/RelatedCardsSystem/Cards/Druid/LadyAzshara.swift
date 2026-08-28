//
//  LadyAzshara.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your hand with random Temporary spells. They cast twice."
// Temporary is a post-pick modifier, ignored for the pool.
class TheWellOfEternityToken: SpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.Druid.LadyAzshara_TheWellOfEternityToken2 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
