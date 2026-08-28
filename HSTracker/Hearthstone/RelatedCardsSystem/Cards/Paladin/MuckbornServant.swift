//
//  MuckbornServant.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Taunt Battlecry: Discover a Paladin card."
class MuckbornServant: PaladinCardPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.MuckbornServant }
}

class MuckbornServantCorePlaceholder: MuckbornServant {
    override func getCardId() -> String { CardIds.Collectible.Paladin.MuckbornServantCorePlaceholder }
}
