//
//  ArchivistElysiana.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover 5 cards. Replace your deck with 2 copies of each."
class ArchivistElysiana: ClassOrNeutralCardPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ArchivistElysiana }
    override func eventCount() -> Int { 5 }
}
