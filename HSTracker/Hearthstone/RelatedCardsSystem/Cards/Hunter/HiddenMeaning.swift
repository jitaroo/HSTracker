//
//  HiddenMeaning.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: When your opponent ends their turn with no Mana, summon a random 3-Cost minion."
class HiddenMeaning: WanderingMonster {
    override func getCardId() -> String { CardIds.Collectible.Hunter.HiddenMeaning }
}
