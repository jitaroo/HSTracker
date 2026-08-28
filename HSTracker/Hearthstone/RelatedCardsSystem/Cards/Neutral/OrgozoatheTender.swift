//
//  OrgozoatheTender.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Naga."
class AzsharasHatcheryToken: ClassOrNeutralNagaMinionPool {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.OrgozoatheTender_AzsharasHatcheryToken }
}

// "Discover 2 Naga."
class AzsharasHatchery: AzsharasHatcheryToken {
    override func getCardId() -> String { CardIds.NonCollectible.Neutral.OrgozoatheTender_AzsharasHatchery }
    override func eventCount() -> Int { 2 }
}
