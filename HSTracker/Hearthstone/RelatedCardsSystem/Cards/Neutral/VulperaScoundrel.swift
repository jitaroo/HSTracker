//
//  VulperaScoundrel.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a spell or pick a mystery choice."
class VulperaScoundrel: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.VulperaScoundrel }
}

class VulperaScoundrelCorePlaceholder: VulperaScoundrel {
    override func getCardId() -> String { CardIds.Collectible.Neutral.VulperaScoundrelCorePlaceholder }
}

// "Add a random spell to your hand."
class MysteryChoiceToken: SpellPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.VulperaScoundrel_MysteryChoiceToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
    override func eventCount() -> Int { 1 }
}
