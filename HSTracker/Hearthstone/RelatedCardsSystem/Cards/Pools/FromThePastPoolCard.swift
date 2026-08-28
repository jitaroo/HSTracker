//
//  FromThePastPoolCard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Base class for "from the past" pools (TIME_TRAVEL-set mechanic): the pool is exactly
// the cards that are NOT Standard-legal, i.e. the inverse of the default legality check.
// The membership rule is format-independent - "the past" is the same card set whether
// the game is Standard, Wild, or Twist.
//
// Do not share a getCardPool across the past/present boundary: the shared base-pool
// cache is keyed by the pool's declaring type and does not know about this legality
// override, so a present-day card inheriting a past pool (or vice versa) would poison
// the cache. Past pools always declare their own getCardPool.
class FromThePastPoolCard: DiscoverPoolCard {
    override func isInLegalPool(_ card: Card, _ gt: GameType, _ format: FormatType) -> Bool {
        guard let set = card.set else { return false }
        return CardSet.wildSets.contains(set)
    }
}
