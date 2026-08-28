//
//  NagaAllies.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Naga minion."
class NagaAllies: ClassOrNeutralNagaMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.NagaAllies }
}
