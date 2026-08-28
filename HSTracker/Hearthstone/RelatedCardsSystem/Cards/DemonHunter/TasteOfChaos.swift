//
//  TasteOfChaos.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deal $2 damage to a minion. Finale: Discover a Fel spell."
class TasteOfChaos: ClassOrNeutralFelSpellPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.TasteOfChaos }
}
