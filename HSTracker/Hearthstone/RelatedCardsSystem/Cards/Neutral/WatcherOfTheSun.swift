//
//  WatcherOfTheSun.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Get a random Holy spell. Forge: Also restore 6 Health to your hero."
class WatcherOfTheSun: HolySpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.WatcherOfTheSun }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

// "Forged Battlecry: Get a random Holy spell. Restore 6 Health to your hero."
class WatcherOfTheSunToken: WatcherOfTheSun {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.WatcheroftheSun_WatcherOfTheSunToken }
}
