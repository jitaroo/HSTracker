//
//  SketchyStranger.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Secret from another class."
class SketchyStranger: OffClassSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SketchyStranger }
}

class SketchyStrangerCore: SketchyStranger {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SketchyStrangerCorePlaceholder }
}
