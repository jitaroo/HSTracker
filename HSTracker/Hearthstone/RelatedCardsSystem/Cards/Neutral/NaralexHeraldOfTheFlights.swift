//
//  NaralexHeraldOfTheFlights.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class NaralexHeraldOfTheFlights: ICardWithHighlight {
    required init() {}

    func getCardId() -> String { CardIds.Collectible.Neutral.NaralexHeraldOfTheFlights }

    func shouldHighlight(card: Card, deck: [Card]) -> HighlightColor {
        return HighlightColorHelper.getHighlightColor(card.isDragon())
    }
}
