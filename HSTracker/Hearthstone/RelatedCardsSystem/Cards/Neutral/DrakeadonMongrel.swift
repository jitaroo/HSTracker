//
//  DrakeadonMongrel.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Summon two random 4-Cost minions."
class DrakeadonMongrel: PilotedSkyGolem {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DrakeadonMongrel }
    override func eventCount() -> Int { 2 }
}
