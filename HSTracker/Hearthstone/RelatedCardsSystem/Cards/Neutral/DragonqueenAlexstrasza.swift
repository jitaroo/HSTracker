//
//  DragonqueenAlexstrasza.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: If your deck has no duplicates, add 2 other random Dragons to your hand. They cost (0)."
class DragonqueenAlexstrasza: BoneDrake {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DragonqueenAlexstrasza }
    override func eventCount() -> Int { 2 }
}
