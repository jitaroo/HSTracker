//
//  SecretIngredient.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Choose One - Give your hero +2 Attack this turn; or get a random Druid card."
class SecretIngredient: DruidCardPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.SecretIngredient }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
