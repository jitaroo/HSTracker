//
//  SelenicDrake.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Elusive At the end of your turn, get a random Dragon."
class SelenicDrake: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.SelenicDrake }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
