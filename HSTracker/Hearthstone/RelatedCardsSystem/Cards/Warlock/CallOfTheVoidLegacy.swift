//
//  CallOfTheVoidLegacy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Add a random Demon to your hand."
class CallOfTheVoidLegacy: DemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.CallOfTheVoidLegacy }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
