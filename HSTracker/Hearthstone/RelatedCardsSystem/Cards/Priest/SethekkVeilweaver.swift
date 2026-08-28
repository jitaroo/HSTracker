//
//  SethekkVeilweaver.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you cast a spell on a minion, add a Priest spell to your hand."
class SethekkVeilweaver: PriestSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.SethekkVeilweaver }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
