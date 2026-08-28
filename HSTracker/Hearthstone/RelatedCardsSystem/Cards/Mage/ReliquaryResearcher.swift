//
//  ReliquaryResearcher.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If you've Excavated twice, cast two random Mage Secrets."
// The two Secrets end up in play together, so they must be distinct: one batch of 2
// unique draws (without replacement), like DiscoAtTheEndOfTime. Pool and Secret
// generator inherited from MageSecretPool.
class ReliquaryResearcher: MageSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.ReliquaryResearcher }
    override func picks() -> Int { 2 }
    override func isWithReplacement() -> Bool { false }
}
