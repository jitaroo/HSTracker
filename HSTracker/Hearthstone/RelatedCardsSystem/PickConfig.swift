//
//  PickConfig.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

/// Encapsulates the sampling parameters that drive keyword-probability calculations for
/// a card's generation or Discover effect.
struct PickConfig {
    /// Cards drawn per sampling event (the batch size): 3 for a standard Discover (3 unique
    /// cards shown simultaneously), 1 for a random summon or random cast.
    let batchSize: Int

    /// Number of independent repetitions of the sampling event: 1 for a single Discover or
    /// summon, 2 for "Discover 2 minions", 8 for "Cast 8 random spells".
    let eventCount: Int

    /// True when every draw within an event samples the full pool independently (binomial
    /// model, as in random summons/casts where the same card can appear multiple times).
    /// False when an event draws `batchSize` unique cards without replacement (hypergeometric
    /// model, as in a Discover showing distinct cards simultaneously).
    let isWithReplacement: Bool
}
