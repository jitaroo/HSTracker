//
//  LightforgedCrusader.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If your deck has no Neutral cards, add 5 random Paladin cards to your hand."
class LightforgedCrusader: PaladinCardPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.LightforgedCrusader }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 5 }
    override func isWithReplacement() -> Bool { true }
}
