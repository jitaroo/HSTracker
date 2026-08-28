//
//  Outlander.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "If you played an Outcast card this turn, Discover a Fel Spell."
class Outlander: ClassOrNeutralFelSpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.Outlander }
}
