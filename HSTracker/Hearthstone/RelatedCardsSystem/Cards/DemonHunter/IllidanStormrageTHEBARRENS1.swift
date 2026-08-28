//
//  IllidanStormrageTHEBARRENS1.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "At the start of your turn, add a random Demon Hunter spell to your hand."
// Demon Hunter spell pool inherited from CosmicManifestations (explicit class name in the text).
class IllidanStormrageTHEBARRENS1: DemonHunterSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.IllidanStormrageTHE_BARRENS1 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
