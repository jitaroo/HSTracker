//
//  Paleomancy.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover an Undead. Spend 5 Corpses to keep all 3 instead."
// The keep-all is conditional, so sampling stays default.
class Paleomancy: ClassOrNeutralUndeadMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.Paleomancy }
}
