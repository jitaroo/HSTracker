//
//  ForgottenMillennium.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your hand with random Undead. They cost Health instead of Mana this turn."
class ForgottenMillennium: UndeadMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.ForgottenMillennium }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { BoardFill.playerSlots }
    override func isWithReplacement() -> Bool { true }
}
