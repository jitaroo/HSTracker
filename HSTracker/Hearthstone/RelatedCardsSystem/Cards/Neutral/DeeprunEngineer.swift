//
//  DeeprunEngineer.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Mech. It costs (1) less."
class DeeprunEngineer: ClassOrNeutralMechMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.DeeprunEngineer }
}
