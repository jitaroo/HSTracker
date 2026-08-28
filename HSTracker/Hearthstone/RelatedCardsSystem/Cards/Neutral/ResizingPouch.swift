//
//  ResizingPouch.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a card with Cost equal to your remaining Mana Crystals." Same live-mana bucket
// as ScrappyScavenger (remaining crystals after paying for this card).
class ResizingPouch: ScrappyScavenger {
    override func getCardId() -> String { CardIds.Collectible.Neutral.ResizingPouch }
}
