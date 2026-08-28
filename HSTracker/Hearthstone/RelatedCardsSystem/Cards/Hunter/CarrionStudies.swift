//
//  CarrionStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Deathrattle minion. Your next one costs (1) less."
class CarrionStudies: ClassOrNeutralDeathrattleMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.CarrionStudies }
}
