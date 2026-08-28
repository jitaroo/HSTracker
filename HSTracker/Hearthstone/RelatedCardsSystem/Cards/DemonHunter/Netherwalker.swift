//
//  Netherwalker.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Demon."
class Netherwalker: ClassOrNeutralDemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.Netherwalker }
}

class NetherwalkerCore: Netherwalker {
    override func getCardId() -> String { CardIds.Collectible.DemonHunter.NetherwalkerCore }
}
