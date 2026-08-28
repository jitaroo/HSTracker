//
//  CosmicManifestations.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal 2 damage. Shuffle a random Demon Hunter spell into your deck. Outcast: Do it again."
class CosmicManifestations: DemonHunterSpellPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.CosmicManifestations }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
