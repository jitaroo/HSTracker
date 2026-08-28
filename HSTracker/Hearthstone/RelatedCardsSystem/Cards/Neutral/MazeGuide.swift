//
//  MazeGuide.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Summon a random 2-Cost minion."
class MazeGuide: PilotedShredder {
    override func getCardId() -> String { CardIds.Collectible.Neutral.MazeGuide }
}

class MazeGuideCore: MazeGuide {
    override func getCardId() -> String { CardIds.Collectible.Neutral.MazeGuideCore }
}
