//
//  EndtimeMurozond.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Fill your board with random Dragons. Fully heal your hero. Skip your next turn."
class EndtimeMurozond: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.EndtimeMurozond }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { BoardFill.playerSlots }
}
