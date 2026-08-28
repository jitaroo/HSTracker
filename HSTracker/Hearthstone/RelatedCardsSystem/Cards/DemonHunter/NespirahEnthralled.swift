//
//  NespirahEnthralled.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After you cast a Fel spell, get a random non-Colossal Naga."
class NespirahUnshackledToken: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.NespirahEnthralled_NespirahUnshackledToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter {
            $0.type == .minion && $0.isNaga() && !$0.mechanics.contains("COLOSSAL")
        }
    }
}
