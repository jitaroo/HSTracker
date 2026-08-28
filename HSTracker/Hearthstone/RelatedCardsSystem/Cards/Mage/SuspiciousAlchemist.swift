//
//  SuspiciousAlchemist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. If your opponent guesses your choice, they get a copy."
class SuspiciousAlchemist: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.SuspiciousAlchemist }
}

class SuspiciousAlchemistCorePlaceholder: SuspiciousAlchemist {
    override func getCardId() -> String { CardIds.Collectible.Mage.SuspiciousAlchemistCorePlaceholder }
}
