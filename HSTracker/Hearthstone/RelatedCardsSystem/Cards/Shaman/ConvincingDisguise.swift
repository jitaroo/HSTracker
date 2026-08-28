//
//  ConvincingDisguise.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform a friendly minion into one that costs (2) more. Infuse (4): Transform all
// friendly minions instead." Modeled as the un-infused, single-target version.
class ConvincingDisguise: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ConvincingDisguise }
    override var costOffset: Int { 2 }
    override var affectsAllTargets: Bool { false }
}

class ConvincingDisguiseCorePlaceholder: ConvincingDisguise {
    override func getCardId() -> String { CardIds.Collectible.Shaman.ConvincingDisguiseCorePlaceholder }
}
