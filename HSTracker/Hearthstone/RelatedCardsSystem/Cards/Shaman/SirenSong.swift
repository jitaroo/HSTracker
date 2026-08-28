//
//  SirenSong.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Get two random spells from spell schools you haven't cast this game." Same
// unplayed-school pool as DiscoveryOfMagic; two random draws instead of a Discover.
class SirenSong: DiscoveryOfMagic {
    override func getCardId() -> String { CardIds.Collectible.Shaman.SirenSong }
    override var config: PickConfig { PickConfig(batchSize: 1, eventCount: 2, isWithReplacement: true) }
}
