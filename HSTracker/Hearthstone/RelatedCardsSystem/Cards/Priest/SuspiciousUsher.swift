//
//  SuspiciousUsher.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Legendary minion. If your opponent guesses your choice, they get a copy."
class SuspiciousUsher: ClassOrNeutralLegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.SuspiciousUsher }
}

class SuspiciousUsherCorePlaceholder: SuspiciousUsher {
    override func getCardId() -> String { CardIds.Collectible.Priest.SuspiciousUsherCorePlaceholder }
}
