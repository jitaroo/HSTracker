//
//  HerosWelcome.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Legendary minion to summon. Set its stats to 10/10."
class HerosWelcome: ClassOrNeutralLegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Paladin.HerosWelcome }
}
