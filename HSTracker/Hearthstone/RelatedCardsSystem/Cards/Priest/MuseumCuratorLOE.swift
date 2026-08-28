//
//  MuseumCuratorLOE.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Deathrattle card. It costs (1) less."
class MuseumCuratorLOE: ClassOrNeutralDeathrattleCardPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.MuseumCuratorLOE }
}

class MuseumCuratorWONDERS: MuseumCuratorLOE {
    override func getCardId() -> String { CardIds.Collectible.Priest.MuseumCuratorWONDERS }
}
