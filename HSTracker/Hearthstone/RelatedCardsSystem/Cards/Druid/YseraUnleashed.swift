//
//  YseraUnleashed.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Casts When Drawn. Summon a random Dragon."
class DreamPortalToken: DragonMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Druid.YseraUnleashed_DreamPortalToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}

// "Battlecry: Shuffle 7 Dream Portals into your deck. When drawn, summon a random Dragon."
class YseraUnleashed: DragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Druid.YseraUnleashed }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 7 }
}
