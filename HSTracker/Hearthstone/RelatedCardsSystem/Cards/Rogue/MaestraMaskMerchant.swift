//
//  MaestraMaskMerchant.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Warlock Tourist Battlecry: Discover a Hero card from the past (from another class)."
class MaestraMaskMerchant: FromThePastPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.MaestraMaskMerchant }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .hero && !$0.isClassOrNeutral(playerClass)
        }
    }
}
