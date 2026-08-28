//
//  HarmonicDisco.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 5-Cost minion. Summon it with +1/+1. (Swaps each turn.)"
class HarmonicDisco: ClassOrNeutralCost5MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.HarmonicDisco }
}

// "Discover a 1-Cost minion. Summon it with +5/+5. (Swaps each turn.)"
class HarmonicDiscoSwapped: ClassOrNeutralCost1MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Paladin.HarmonicDisco_DissonantDiscoToken }
}
