//
//  Renew.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Restore 3 Health. Discover a spell."
class Renew: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.Renew }
}
