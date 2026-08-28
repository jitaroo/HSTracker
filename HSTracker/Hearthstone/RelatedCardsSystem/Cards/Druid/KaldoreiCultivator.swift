//
//  KaldoreiCultivator.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover 2 Beasts. Put them on the bottom of your deck with +5/+5."
class KaldoreiCultivator: ClassOrNeutralBeastMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.KaldoreiCultivator }
    override func picks() -> Int { 3 }
    override func eventCount() -> Int { 2 }
}
