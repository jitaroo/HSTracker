//
//  SandsOfTime.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Rewind Discover a spell from ANY class. (Or just your class after you Rewind!)"
// Technically the first pick of Sands of Time is any spell, but it is more useful to show
// the class-specific pool, as it also helps with the Rewind decision. Spell pool inherited
// from Astrobiologist.
class SandsOfTime: ClassOrNeutralSpellPool {
    override func getCardId() -> String { CardIds.Collectible.Neutral.SandsOfTime }
}
