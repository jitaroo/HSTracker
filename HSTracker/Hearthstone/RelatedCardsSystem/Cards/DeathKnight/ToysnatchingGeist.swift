//
//  ToysnatchingGeist.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Gigantify Battlecry: Discover an Undead. Reduce its Cost by this minion's Attack."
class ToysnatchingGeist: ClassOrNeutralUndeadMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.ToysnatchingGeist }
}

class ToysnatchingGeistToken: ToysnatchingGeist {
    override func getCardId() -> String { CardIds.NonCollectible.Deathknight.ToysnatchingGeist_ToysnatchingGeistToken }
}
