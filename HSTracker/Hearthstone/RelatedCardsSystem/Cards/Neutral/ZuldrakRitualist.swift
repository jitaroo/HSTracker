//
//  ZuldrakRitualist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt. Battlecry: Summon three random 1-Cost minions for your opponent."
class ZuldrakRitualist: GravelsnoutKnight {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ZuldrakRitualist }
    override func eventCount() -> Int { 3 }
}
