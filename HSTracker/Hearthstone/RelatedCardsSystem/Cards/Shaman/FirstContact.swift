//
//  FirstContact.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon two random 1-Cost minions. Overload: (1)"
class FirstContact: MaelstromPortal {
    override func getCardId() -> String { CardIds.Collectible.Shaman.FirstContact }
    override func eventCount() -> Int { 2 }
}
