//
//  WelcomeHome.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Reopen a location. Give it "Deathrattle: Summon a random 3-Cost minion.""
class WelcomeHome: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WelcomeHome }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
