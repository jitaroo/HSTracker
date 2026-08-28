//
//  HauntingVisions.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "The next spell you cast this turn costs (3) less. Discover a spell."
class HauntingVisions: Marshspawn {
    override func getCardId() -> String { CardIds.Collectible.Shaman.HauntingVisions }
}
