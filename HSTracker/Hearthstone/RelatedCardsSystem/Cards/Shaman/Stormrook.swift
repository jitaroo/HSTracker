//
//  Stormrook.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Whenever you would damage this with a Nature spell, summon a random 5-Cost minion instead."
class Stormrook: TinyToys {
    override func getCardId() -> String { CardIds.Collectible.Shaman.Stormrook }
    override func eventCount() -> Int { 1 }
}
