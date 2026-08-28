//
//  DrakefireAmulet.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Tradeable Discover 2 Dragons. Summon them."
class DrakefireAmulet: AzureExplorer {
    override func getCardId() -> String { CardIds.Collectible.Mage.DrakefireAmulet }
    override func eventCount() -> Int { 2 }
}
