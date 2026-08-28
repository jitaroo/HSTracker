//
//  HungryEttin.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Summon a random 2-Cost minion for your opponent."
class HungryEttin: PilotedShredder {
    override func getCardId() -> String { CardIds.Collectible.Neutral.HungryEttin }
}
