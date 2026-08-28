//
//  EmberscarredWhelp.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a 5-Cost card. Gain 1 Mana Crystal next turn only."
class EmberscarredWhelp: ClassOrNeutralCost5CardPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.EmberscarredWhelp }
}
