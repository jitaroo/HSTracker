//
//  BaneOfDoom.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $3 damage to a character. If it dies, summon a random Demon."
class BaneOfDoomExpert1: CallOfTheVoidLegacy {
    override func getCardId() -> String { CardIds.Collectible.Warlock.BaneOfDoomExpert1 }
}

class BaneOfDoomVanilla: BaneOfDoomExpert1 {
    override func getCardId() -> String { CardIds.Collectible.Warlock.BaneOfDoomVanilla }
}

class BaneOfDoomWONDERS: BaneOfDoomExpert1 {
    override func getCardId() -> String { CardIds.Collectible.Warlock.BaneOfDoomWONDERS }
}
