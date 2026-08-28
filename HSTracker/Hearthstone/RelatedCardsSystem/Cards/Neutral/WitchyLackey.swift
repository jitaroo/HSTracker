//
//  WitchyLackey.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Transform a friendly minion into one that costs (1) more." Non-collectible
// Lackey token.
class WitchyLackey: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.WitchyLackey }
    override var costOffset: Int { 1 }
    override var affectsAllTargets: Bool { false }
}
