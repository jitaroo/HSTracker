//
//  TitanforgedTraps.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover and cast a Secret. Forge: Do it twice."
class TitanforgedTraps: ClassOrNeutralSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.TitanforgedTraps }
}

// "Forged Discover and cast two Secrets."
class TitanforgedTrapsToken: TitanforgedTraps {
    override func getCardId() -> String { CardIds.NonCollectible.Hunter.TitanforgedTraps_TitanforgedTrapsToken }
    override func eventCount() -> Int { 2 }
}
