//
//  TunnelTerror.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get two random Temporary 2-Cost minions." (Temporary is a post-pick modifier)
class TunnelTerror: Cost2MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.TunnelTerror }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 2 }
    override func isWithReplacement() -> Bool { true }
}
