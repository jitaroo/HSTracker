//
//  DemonicDynamics.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover 2 Demons. Finale: Give them +1/+2."
class DemonicDynamics: DemonicStudies {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DemonicDynamics }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }
}
