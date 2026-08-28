//
//  Griftah.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover two cards. Give one to your opponent at random."
class Griftah: ClassOrNeutralCardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.Griftah }
    override func eventCount() -> Int { 2 }
}
