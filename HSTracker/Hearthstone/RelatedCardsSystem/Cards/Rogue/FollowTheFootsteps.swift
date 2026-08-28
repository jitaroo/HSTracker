//
//  FollowTheFootsteps.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Stealth minion. Give it this effect for a turn."
class FollowTheFootsteps: ClassOrNeutralStealthMinionPool {
    override func getCardId() -> String { CardIds.Collectible.Rogue.FollowTheFootsteps }
}
