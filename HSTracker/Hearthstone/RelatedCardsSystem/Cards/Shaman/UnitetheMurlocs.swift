//
//  UnitetheMurlocs.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Fill your hand with random Murlocs."
class MegafinToken: MurlocMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Shaman.UnitetheMurlocs_MegafinToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
