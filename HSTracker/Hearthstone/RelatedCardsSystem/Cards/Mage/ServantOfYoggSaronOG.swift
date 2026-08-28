//
//  ServantOfYoggSaronOG.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Cast a random spell that costs (5) or MORE (targets chosen randomly)."
class ServantOfYoggSaronOG: CostAtLeast5SpellPool {
    override func getCardId() -> String { CardIds.Collectible.Mage.ServantOfYoggSaronOG }
    override func picks() -> Int { 1 }
    override func isWithReplacement() -> Bool { true }
}

class ServantOfYoggSaronWONDERS: ServantOfYoggSaronOG {
    override func getCardId() -> String { CardIds.Collectible.Mage.ServantOfYoggSaronWONDERS }
}
