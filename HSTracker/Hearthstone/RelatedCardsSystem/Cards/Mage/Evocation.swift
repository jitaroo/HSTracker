//
//  Evocation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Fill your hand with random Mage spells. They are Temporary."
class Evocation: BabblingBook {
    override func getCardId() -> String { CardIds.Collectible.Mage.Evocation }
    override func isWithReplacement() -> Bool { true }
}
