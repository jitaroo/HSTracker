//
//  WanderingMonster.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: When an enemy attacks your hero, summon a 3-Cost minion as the new target."
class WanderingMonster: Cost3MinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.WanderingMonster }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class WanderingMonsterCorePlaceholder: WanderingMonster {
    override func getCardId() -> String { CardIds.Collectible.Hunter.WanderingMonsterCorePlaceholder }
}
