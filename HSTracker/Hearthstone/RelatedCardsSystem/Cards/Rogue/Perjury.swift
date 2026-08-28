//
//  Perjury.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: When your turn starts, Discover and cast a Secret from another class."
class Perjury: OffClassSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Perjury }
}

class PerjuryCore: Perjury {
    override func getCardId() -> String { CardIds.Collectible.Rogue.PerjuryCorePlaceholder }
}
