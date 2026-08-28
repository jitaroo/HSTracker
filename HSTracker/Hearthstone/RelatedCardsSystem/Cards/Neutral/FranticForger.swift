//
//  FranticForger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random playable spell. It is Temporary."
// All-spells pool inherited from YoggInTheBox. Known approximation: "playable" depends on
// remaining mana (live state), which a static pool cannot express — the pool shows every
// spell regardless of cost. Temporary is a post-pick modifier.
class FranticForger: SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.FranticForger }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
