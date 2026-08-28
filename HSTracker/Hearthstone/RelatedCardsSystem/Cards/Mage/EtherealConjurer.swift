//
//  EtherealConjurer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell."
class EtherealConjurer: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.EtherealConjurer }
}

class EtherealConjurerCorePlaceholder: EtherealConjurer {
    override func getCardId() -> String { CardIds.Collectible.Mage.EtherealConjurerCorePlaceholder }
}
