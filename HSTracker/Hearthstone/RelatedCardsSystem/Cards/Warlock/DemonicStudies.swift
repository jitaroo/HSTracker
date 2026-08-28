//
//  DemonicStudies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Demon. Your next one costs (1) less."
class DemonicStudies: ClassOrNeutralDemonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DemonicStudies }
}

class DemonicStudiesCorePlaceholder: DemonicStudies {
    override func getCardId() -> String { CardIds.Collectible.Warlock.DemonicStudiesCorePlaceholder }
}
