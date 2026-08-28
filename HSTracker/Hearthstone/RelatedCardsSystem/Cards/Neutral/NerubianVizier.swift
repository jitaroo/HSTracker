//
//  NerubianVizier.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. If a friendly Undead died after your last turn, it costs (2) less."
class NerubianVizier: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.NerubianVizier }
}
