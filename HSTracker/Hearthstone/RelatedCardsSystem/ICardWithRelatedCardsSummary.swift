//
//  ICardWithRelatedCardsSummary.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

protocol ICardWithRelatedCardsSummary: ICardWithRelatedCards {
    /// Cards drawn per sampling event (the batch size per Discover/summon/cast invocation).
    /// 3 for a standard Discover, 1 for a random single-card generation effect.
    func picks() -> Int

    /// Number of independent repetitions of the sampling event. Default is 1;
    /// 2 for "Discover 2 minions", 8 for "Cast 8 random spells", etc.
    func eventCount() -> Int

    /// When true, each draw within an event is independent (binomial/with-replacement
    /// model) - random summons and casts, where the full pool is available for every
    /// draw. When false (default), an event draws `picks()` unique cards simultaneously
    /// without replacement (hypergeometric model), as in a standard Discover.
    func isWithReplacement() -> Bool
}
