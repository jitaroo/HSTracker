//
//  StonehillDefender.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Discover a Taunt minion."
class StonehillDefender: ClassOrNeutralTauntMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.StonehillDefender }
}

class StonehillDefenderCore: StonehillDefender {
    override func getCardId() -> String { CardIds.Collectible.Neutral.StonehillDefenderCore }
}
