//
//  DurnholdeImposter.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Each turn this is in your hand, transform it into a random 3-Cost minion that gains Poisonous."
class DurnholdeImposter: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.DurnholdeImposter }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
