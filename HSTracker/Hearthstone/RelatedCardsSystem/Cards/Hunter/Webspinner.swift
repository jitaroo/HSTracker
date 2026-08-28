//
//  Webspinner.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Get a random Beast."
class Webspinner: BeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.Webspinner }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class WebspinnerCorePlaceholder: Webspinner {
    override func getCardId() -> String { CardIds.Collectible.Hunter.WebspinnerCorePlaceholder }
}
