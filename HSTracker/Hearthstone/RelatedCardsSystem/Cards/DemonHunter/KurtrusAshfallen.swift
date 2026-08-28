//
//  KurtrusAshfallen.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a Demon Hunter spell to your hand."
// Demon Hunter spell pool inherited from CosmicManifestations (explicit class name in the text).
class KurtrusAshfallenSTORMWIND: DemonHunterSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.KurtrusAshfallenSTORMWIND }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

// "Rush. After this attacks and kills a minion, add a Fel spell to your hand."
class KurtrusAshfallenToken1: FelSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.KurtrusAshfallenToken1 }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
