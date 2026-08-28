//
//  FarseerWo.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Elusive After you cast a spell, Discover a Nature spell from the past."
class FarseerWo: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Shaman.FarseerWo }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .spell && $0.isClassOrNeutral(playerClass) && $0.spellSchool == .nature
        }
    }
}
