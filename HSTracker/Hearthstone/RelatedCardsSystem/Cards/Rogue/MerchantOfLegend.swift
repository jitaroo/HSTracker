//
//  MerchantOfLegend.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a Legendary minion. Shuffle the other two into your deck."
class MerchantOfLegend: ClassOrNeutralLegendaryMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.MerchantOfLegend }
}
