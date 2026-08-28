//
//  ThrallDeathseer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform your minions into random ones that cost (2) more."
class ThrallDeathseer: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ThrallDeathseer }
    override var costOffset: Int { 2 }
}

class ThrallDeathseerCorePlaceholder: ThrallDeathseer {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ThrallDeathseerCorePlaceholder }
}
