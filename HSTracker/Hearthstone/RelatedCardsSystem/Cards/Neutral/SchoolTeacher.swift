//
//  SchoolTeacher.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Add a 1/1 Nagaling to your hand. Discover a spell that costs (3) or less to teach it."
class SchoolTeacher: ClassOrNeutralCostAtMost3SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SchoolTeacher }
}
