//
//  GraveCall.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon a random undead."
class GraveCall: UndeadMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Deathknight.GraveCall }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { BoardFill.playerSlots }
    override func isWithReplacement() -> Bool { true }
}
