//
//  MechagnomeGuide.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell. Forge: It costs (3) less."
class MechagnomeGuide: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.MechagnomeGuide }
}

// "Forged Battlecry: Discover a spell. It costs (3) less."
class MechagnomeGuideToken: MechagnomeGuide {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.MechagnomeGuide_MechagnomeGuideToken }
}
