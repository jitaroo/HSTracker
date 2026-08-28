//
//  ChromaticEgg.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Secretly Discover a Dragon to hatch into. Deathrattle: Hatch!"
class ChromaticEgg: ClassOrNeutralDragonMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ChromaticEgg }
}
