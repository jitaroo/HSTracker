//
//  VelarokWindblade.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Charge After this attacks, Discover a card from another class. It costs (3) less."
// Standard Discover sampling.
class VelarokTheDeceiverToken: OffClassCardPool {
    override func getCardId() -> String { CardIds.NonCollectible.Rogue.VelarokWindblade_VelarokTheDeceiverToken }
    override func picks() -> Int { 3 }
    override func isWithReplacement() -> Bool { false }
}
