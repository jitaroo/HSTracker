//
//  SnakeEyes.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a 1-Cost card."
class SnakeEyesRolledAOneToken: ClassOrNeutralCost1CardPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledAOneToken }
}

// "Discover a 2-Cost card."
class SnakeEyesRolledATwoToken: ClassOrNeutralCost2CardPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledATwoToken }
}

// "Discover a 3-Cost card."
class SnakeEyesRolledAThreeToken: ClassOrNeutralCost3CardPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledAThreeToken }
}

// "Discover a 4-Cost card."
class SnakeEyesRolledAFourToken: ClassOrNeutralCost4CardPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledAFourToken }
}

// "Discover a 5-Cost card."
class SnakeEyesRolledAFiveToken: ClassOrNeutralCost5CardPool {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledAFiveToken }
}

// "Discover a 6-Cost card."
class SnakeEyesRolledASixToken: DiscoverPoolCard {
    override func getCardId() -> String { CardIds.NonCollectible.DemonHunter.SnakeEyes_RolledASixToken }

    override func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        return Cards.collectible().filter { $0.cost == 6 && $0.isClassOrNeutral(playerClass) }
    }
}
