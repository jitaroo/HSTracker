//
//  RinlingsRifle.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "After your hero attacks, Discover a Secret and cast it."
class RinlingsRifle: ClassOrNeutralSecretPool {
    override func getCardId() -> String { CardIds.Collectible.Hunter.RinlingsRifle }
}
