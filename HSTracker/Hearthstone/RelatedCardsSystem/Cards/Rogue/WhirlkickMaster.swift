//
//  WhirlkickMaster.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you play a Combo card, add a random Combo card to your hand."
class WhirlkickMaster: ComboCardPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.WhirlkickMaster }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
