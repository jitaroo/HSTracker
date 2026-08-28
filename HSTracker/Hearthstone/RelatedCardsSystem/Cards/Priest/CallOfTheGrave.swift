//
//  CallOfTheGrave.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Deathrattle minion. If you have enough Mana to play it, trigger its Deathrattle."
class CallOfTheGrave: ClassOrNeutralDeathrattleMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Priest.CallOfTheGrave }
}
