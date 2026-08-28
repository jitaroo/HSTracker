//
//  CriminalContract.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Summon three random 3-Cost minions."
class CriminalContract: Cost3MinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Warlock.GodfatherKazakus_CriminalContractToken }
    override func picks() -> Int { 1 }
    override func eventCount() -> Int { 3 }
    override func isWithReplacement() -> Bool { true }
}
