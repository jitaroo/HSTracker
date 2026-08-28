//
//  RazzleDazzler.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random 5-Cost minion. Repeat for each spell school you've cast this game."
class RazzleDazzler: TinyToys {
    override func getCardId() -> String { CardIds.Collectible.Shaman.RazzleDazzler }
    override func eventCount() -> Int { 1 }
}
