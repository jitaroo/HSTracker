//
//  TheStarsAlign.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Transform minions in your hand into ones that cost (3) more. (They keep their original
// Cost.)"
class TheStarsAlign: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Priest.TheStarsAlign }
    override var costOffset: Int { 3 }
    override var targetSource: RelativeCostTargetSource { .handMinions }
}
