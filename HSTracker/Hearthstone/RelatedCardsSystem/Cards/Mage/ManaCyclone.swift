//
//  ManaCyclone.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: For each spell you've cast this turn, add a random Mage spell to your hand."
class ManaCyclone: BabblingBook {
    override func getCardId() -> String { CardIds.Collectible.Mage.ManaCyclone }
}
