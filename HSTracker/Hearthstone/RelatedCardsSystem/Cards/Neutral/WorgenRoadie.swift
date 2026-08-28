//
//  WorgenRoadie.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Deathrattle: Add a random weapon to your opponent's hand."
class InstrumentCaseToken: WeaponPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.WorgenRoadie_InstrumentCaseToken }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}
