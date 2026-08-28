//
//  MarinTheManager.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Legendary minion. Summon two copies of it."
class ZarogsCrownToken: LegendaryMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.MarintheManager_ZarogsCrownToken }
}
