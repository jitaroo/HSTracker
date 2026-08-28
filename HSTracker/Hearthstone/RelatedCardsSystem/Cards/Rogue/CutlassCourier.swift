//
//  CutlassCourier.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class CutlassCourier: ICardWithHighlight {
    required init() {}

    func getCardId() -> String { CardIds.Collectible.Rogue.CutlassCourier }

    func shouldHighlight(card: Card, deck: [Card]) -> HighlightColor {
        return HighlightColorHelper.getHighlightColor(card.isPirate(), card.type == .minion)
    }
}
