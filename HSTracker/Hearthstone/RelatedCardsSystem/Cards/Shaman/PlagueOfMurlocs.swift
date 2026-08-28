//
//  PlagueOfMurlocs.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform all minions into random Murlocs."
class PlagueOfMurlocs: MurlocMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.PlagueOfMurlocs }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
