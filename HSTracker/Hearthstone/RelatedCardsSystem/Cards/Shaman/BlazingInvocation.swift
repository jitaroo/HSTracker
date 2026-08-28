//
//  BlazingInvocation.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Battlecry minion. It costs (1) less."
class BlazingInvocation: ClassOrNeutralBattlecryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BlazingInvocation }
}

class BlazingInvocationCore: BlazingInvocation {
    override func getCardId() -> String { CardIds.Collectible.Shaman.BlazingInvocationCore }
}
