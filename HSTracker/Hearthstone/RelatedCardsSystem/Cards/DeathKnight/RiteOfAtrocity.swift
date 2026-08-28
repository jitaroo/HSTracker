//
//  RiteOfAtrocity.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover an Undead. Spend 2 Corpses to give it a Dark Gift."
class RiteOfAtrocity: ClassOrNeutralUndeadMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Deathknight.RiteOfAtrocity }
}
