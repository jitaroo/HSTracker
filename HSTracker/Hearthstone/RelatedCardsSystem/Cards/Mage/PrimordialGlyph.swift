//
//  PrimordialGlyph.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. Reduce its Cost by (2)."
class PrimordialGlyph: RunedOrb {
    override func getCardId() -> String { CardIds.Collectible.Mage.PrimordialGlyph }
}

class PrimordialGlyphCorePlaceholder: PrimordialGlyph {
    override func getCardId() -> String { CardIds.Collectible.Mage.PrimordialGlyphCorePlaceholder }
}
