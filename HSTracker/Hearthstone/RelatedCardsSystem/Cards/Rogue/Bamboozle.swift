//
//  Bamboozle.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Secret: When one of your minions is attacked, transform it into a random one that costs
// (3) more." Which minion gets attacked is unknown, so friendly minions are candidates and
// the summary averages over them.
class Bamboozle: RelativeCostPoolCard {
    override func getCardId() -> String { CardIds.Collectible.Rogue.Bamboozle }
    override var costOffset: Int { 3 }
    override var affectsAllTargets: Bool { false }
}
